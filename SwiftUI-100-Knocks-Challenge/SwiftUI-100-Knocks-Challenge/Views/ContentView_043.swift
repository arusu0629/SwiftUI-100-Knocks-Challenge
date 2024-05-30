//
//  ContentView_043.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/05/30.
//

import SwiftUI

///  GitHubのAPIを叩き、リポジトリの情報をリストに表示する。一番下までスクロールされたら追加で取得する。
struct ContentView_043: ViewWithTitle {
    let title: String = "043: GitHubのAPIを叩き、リポジトリの情報をリストに表示する。一番下までスクロールされたら追加で取得をする。"
    @StateObject private var viewModel = GitHubViewModel()
    @State private var username = "apple"

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
        private var page = 1
        private let perPage = 20

        func fetchRepositories(for user: String) async {
            guard let url = URL(string: "https://api.github.com/users/\(user)/repos?page=\(page)&per_page=\(perPage)") else {
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
                print("Error fetching repositories: \(error)")
            }
        }

        func reset() {
            repositories = []
            page = 1
            canLoadMore = true
        }
    }
}

/*
 解答例
 struct ContentView: View {
     @State var repositories: [Repository] = []
     @State var page = 1
     @State var isFetching = false
     @State var showingErrorAlert = false

     let gitHubAPIRepository = GitHubAPIRepository()

     var body: some View {
         List {
             ForEach(repositories) { repository in
                 VStack(alignment: .leading) {
                     Text(repository.name)
                         .font(Font.system(size: 24).bold())
                     Text(repository.description ?? "")
                     Text("Star: \(repository.stargazersCount)")
                 }
                 .onAppear {
                     if repositories.last == repository {
                         fetchRepositories()
                     }
                 }
             }

             HStack {
                 if isFetching {
                     Spacer()
                     ProgressView()
                     Spacer()
                 }
             }
         }
         .onAppear {
             fetchRepositories()
         }
         .alert("Error", isPresented: $showingErrorAlert) {
             Button("Close", action: {})
         } message: {
             Text("Failed to Fetch repositories.")
         }
     }

     @MainActor
     func fetchRepositories() {
         if isFetching {
             return
         }
         isFetching = true

         Task {
             do {
                 repositories += try await gitHubAPIRepository.searchRepos(page: page, perPage: 20)
                 page += 1
                 isFetching = false
             } catch {
                 isFetching = false
                 showingErrorAlert = true
             }
         }
     }
 }


 struct GitHubAPIRepository {
     func searchRepos(page: Int, perPage: Int) async throws -> [Repository] {
         let url = URL(string: "https://api.github.com/search/repositories?q=swift&sort=stars&page=\(page)&per_page=\(perPage)")!
         let (data, urlResponse) = try await URLSession.shared.data(from: url)
         let response = try JSONDecoder().decode(GithubSearchResult.self, from: data)
         return response.items
     }
 }

 struct GithubSearchResult: Codable {
     let items: [Repository]
 }

 struct Repository: Codable, Identifiable, Equatable {
     let id: Int
     let name: String
     let description: String?
     let stargazersCount: Int

     enum CodingKeys: String, CodingKey {
         case id
         case name
         case description
         case stargazersCount = "stargazers_count"
     }
 }
 */

#Preview {
    NavigationStack {
        ContentView_043()
    }
}
