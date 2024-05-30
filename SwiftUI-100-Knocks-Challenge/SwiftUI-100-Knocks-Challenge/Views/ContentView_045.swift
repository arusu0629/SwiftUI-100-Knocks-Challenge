//
//  ContentView_045.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/05/30.
//

import SwiftUI

/// SwiftUI で AppStorage を使って UserDefault の値を監視する
struct ContentView_045: ViewWithTitle {
    let title: String = "045: AppStorage を使って UserDefault の値を監視する"
    @AppStorage("FavoritePokemon") private var favoritePokemon = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Your favorite pokemon is, \(favoritePokemon)")
            Button("Snorlax is my favorite pokemon.") {
                favoritePokemon = "Snorlax"
            }
            Button("Slowpoke is my favorite pokemon.") {
                favoritePokemon = "Slowpoke"
            }
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

/*
 解答例
 struct ContentView: View {
     @AppStorage("FAVORITE_POKEMON_NAME") var favoritePokemonName: String = ""

     var body: some View {
         VStack(spacing: 16) {
             Text("Your favorite pokemon is, \(favoritePokemonName)")

             Button("Snorlax is my mavorite pokemon.") {
                 favoritePokemonName = "Snorlax"
             }

             Button("Slowpoke is my mavorite pokemon.") {
                 UserDefaults.standard.set("Slowpoke", forKey: "FAVORITE_POKEMON_NAME")
             }
         }
     }
 }
 */

#Preview {
    NavigationStack {
        ContentView_045()
    }
}
