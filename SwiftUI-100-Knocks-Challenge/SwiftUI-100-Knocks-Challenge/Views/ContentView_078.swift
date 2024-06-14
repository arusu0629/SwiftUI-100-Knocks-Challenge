//
//  ContentView_078.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/06/14.
//

import SwiftUI

/// async, await を使って API から画像を取得し、全てが揃ってから表示する
struct ContentView_078: ViewWithTitle {
    let title: String = "078: async, await を使って API から画像を取得し、全てが揃ってから表示する"
    let count = 30
    @StateObject private var viewModel = PokemonViewModel()

    var body: some View {
        ZStack {
            List(viewModel.pokemons) { pokemon in
                HStack {
                    Image(uiImage: pokemon.image)
                        .resizable()
                        .frame(width: 128, height: 128)

                    VStack(alignment: .leading) {
                        Text("No: \(pokemon.id)")
                        Text(pokemon.name)
                    }
                }
            }

            if viewModel.pokemons.isEmpty {
                ProgressView()
            }
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await viewModel.fetchPokemon(count: count)
        }
    }

    struct PokemonResponse: Decodable {
        let id: Int
        let name: String
        let sprites: Sprites

        struct Sprites: Decodable {
            let frontDefault: String
            enum CodingKeys: String, CodingKey {
                case frontDefault = "front_default"
            }
        }
    }

    struct Pokemon: Identifiable {
        let id: Int
        let name: String
        let image: UIImage
    }

    @MainActor
    final class PokemonViewModel: ObservableObject {
        @Published var pokemons: [Pokemon] = []

        func fetchPokemon(count: Int) async {
            let pokemonURLs = (1...count).map { URL(string: "https://pokeapi.co/api/v2/pokemon/\($0)")! }

            do {
                let pokemons = try await withThrowingTaskGroup(of: Pokemon.self) { group -> [Pokemon] in
                    for url in pokemonURLs {
                        group.addTask {
                            // APIデータ取得
                            let (data, _) = try await URLSession.shared.data(from: url)
                            // レスポンス変換
                            let response = try JSONDecoder().decode(PokemonResponse.self, from: data)
                            // 画像読み込み
                            let (imageData, _) = try await URLSession.shared.data(from: URL(string: response.sprites.frontDefault)!)
                            // モデル生成
                            return Pokemon(
                                id: response.id,
                                name: response.name,
                                image: UIImage(data: imageData)!
                            )
                        }
                    }
                    var pokemons: [Pokemon] = []
                    for try await pokemon in group {
                        pokemons.append(pokemon)
                    }
                    return pokemons
                }
                self.pokemons = pokemons.sorted { $0.id < $1.id }
            } catch {
                print("Failed to fetch Pokemon data: \(error)")
            }
        }
    }
}

/*
 解答例
 struct ContentView: View {
     @State var pokemons: [Pokemon] = []

     var body: some View {
         VStack {
             ForEach(pokemons) { pokemon in
                 HStack {
                     Image(uiImage: pokemon.image)
                         .resizable()
                         .frame(width: 100, height: 100)
                     VStack(alignment: .leading) {
                         Text("No: \(pokemon.id)")
                         Text(pokemon.name)
                         Text(pokemon.name)
                     }
                     Spacer()
                 }
                 Divider()
             }
         }
         .task {
             guard let pokemons = try? await fetchPokemons() else {
                 return
             }
             await MainActor.run {
                 self.pokemons = pokemons
             }
         }
     }

     private func fetchPokemons() async throws -> [Pokemon]{
         let host = "https://swiswiswift.com/2022-06-16"
         let url = URL(string: "\(host)/pokemons.json")!
         let (data, _) = try await URLSession.shared.data(from: url)
         let pokemonResponses = try JSONDecoder().decode([PokemonResponse].self, from: data)

         var pokemons: [Pokemon] = []
         for pokemonResponse in pokemonResponses {
             let imageUrl = URL(string: "\(host)/\(pokemonResponse.imageName)")!
             let (data, _) = try await URLSession.shared.data(from: imageUrl)
             let image = UIImage(data: data)!
             let pokemon = Pokemon(
                 id: pokemonResponse.id,
                 name: pokemonResponse.name,
                 imageName: pokemonResponse.name,
                 image: image)
             pokemons.append(pokemon)
         }
         return pokemons
     }
 }

 struct Pokemon: Identifiable {
     let id: Int
     let name: String
     let imageName: String
     let image: UIImage
 }

 struct PokemonResponse: Decodable {
     let id: Int
     let name: String
     let imageName: String
 }
*/

#Preview {
    NavigationStack {
        ContentView_078()
    }
}
