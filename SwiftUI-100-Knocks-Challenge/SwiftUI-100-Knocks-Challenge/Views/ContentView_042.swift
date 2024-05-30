//
//  ContentView_042.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/05/30.
//

import SwiftUI

///  (オリジナル)GitHubのAPIを叩き、リポジトリの情報をリストに表示する。リポジトリの情報取得に失敗したらアラートを表示する
struct ContentView_042: ViewWithTitle {
    let title: String = "042: GitHubのAPIを叩き、リポジトリの情報をリストに表示する。リポジトリの情報取得に失敗したらアラートを表示する"
    @StateObject private var viewModel = GitHubViewModel()
    @State private var username = "arusu0629"
    @State private var isShowingAlert = false

    var body: some View {
        NavigationStack {
            if viewModel.isLoading && viewModel.repositories.isEmpty {
                ProgressView("Fetching repositories...")
            } else {
                List(viewModel.repositories) { repo in
                    VStack(alignment: .leading) {
                        Text(repo.name)
                            .font(.headline)
                        Text(repo.description ?? "No description")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                        Link("View on GitHub", destination: URL(string: repo.html_url)!)
                    }
                    .onAppear {
                        if repo == viewModel.repositories.last && viewModel.canLoadMore {
                            Task {
                                await viewModel.fetchRepositories(for: username)
                                if viewModel.errorMessage != nil {
                                    isShowingAlert = true
                                }
                            }
                        }
                    }
                }
                HStack {
                    if viewModel.isLoading {
                        Spacer()
                        ProgressView("Fetching repositories...")
                        Spacer()
                    }
                }
            }
        }
        .task {
            await viewModel.fetchRepositories(for: username)
            if viewModel.errorMessage != nil {
                isShowingAlert = true
            }
        }
        .alert("Error", isPresented: $isShowingAlert, presenting: viewModel.errorMessage) { _ in
            Button("Retry") {
                Task {
                    await viewModel.retryFetch(for: username)
                    if viewModel.errorMessage != nil {
                        isShowingAlert = true
                    }
                }
            }
            Button("Cancel", role: .cancel) { }
        } message: { errorMessage in
            Text(errorMessage)
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }

    /// リポジトリのモデル
    struct Repository: Identifiable, Codable, Equatable {
        let id: Int
        let name: String
        let description: String?
        let html_url: String
    }

    /// リポジトリを取得する ViewModel
    @MainActor
    final class GitHubViewModel: ObservableObject {
        @Published var repositories = [Repository]()
        @Published var isLoading = false
        @Published var canLoadMore = true
        @Published var errorMessage: String? = nil
        private var page = 1
        private let perPage = 20

        func fetchRepositories(for user: String) async {
            guard let url = URL(string: "https://api.github.com/users/\(user)/repos?page=\(page)&per_page=\(perPage)") else {
                self.errorMessage = "Invalid URL"
                return
            }
            isLoading = true
            defer { isLoading = false }
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let newRepositories = try JSONDecoder().decode([Repository].self, from: data)
                if newRepositories.isEmpty {
                    canLoadMore = false
                } else {
                    repositories.append(contentsOf: newRepositories)
                    page += 1
                }
            } catch {
                self.errorMessage = "Error fetching repositories: \(error.localizedDescription)"
            }
        }

        func reset() {
            repositories = []
            page = 1
            canLoadMore = true
            errorMessage = nil
        }

        func retryFetch(for user: String) async {
            await fetchRepositories(for: user)
        }
    }
}

#Preview {
    NavigationStack {
        ContentView_042()
    }
}
