//
//  ContentView_041.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/05/28.
//

import SwiftUI

///  GitHubのAPIを叩き、リポジトリの情報をリストに表示する（async, await）
struct ContentView_041: ViewWithTitle {
    let title: String = "041: GitHubのAPIを叩き、リポジトリの情報をリストに表示する"
    @StateObject private var viewModel = GitHubViewModel()

    var body: some View {
        NavigationStack {
            if viewModel.isLoading {
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
                }
            }
        }
        .task {
            await viewModel.fetchRepositories(for: "arusu0629")
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }

    /// リポジトリのモデル
    struct Repository: Identifiable, Codable {
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

        func fetchRepositories(for user: String) async {
            guard let url = URL(string: "https://api.github.com/users/\(user)/repos") else {
                return
            }

            isLoading = true
            defer { isLoading = false }
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let repositories = try JSONDecoder().decode([Repository].self, from: data)
                self.repositories = repositories
            } catch {
                print("Error fetching repositories: \(error)")
            }
        }
    }
}

/*
 解答例
 struct ContentView: View {
     @State var repositories: [Repository] = []
     @State var showingErrorAlert = false

     let gitHubAPIRepository = GitHubAPIRepository()

     var body: some View {
             List(repositories) { repository in
                 VStack(alignment: .leading) {
                     Text(repository.name)
                         .font(Font.system(size: 24).bold())
                     Text(repository.description ?? "")
                     Text("Star: \(repository.stargazersCount)")
                 }
             }.onAppear {
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
         Task {
             do {
                 repositories = try await gitHubAPIRepository.searchRepos(page:1, perPage: 20)
             } catch {
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
        ContentView_041()
    }
}
