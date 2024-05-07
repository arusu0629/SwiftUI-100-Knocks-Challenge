//
//  ContentView_007.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/05/07.
//

import SwiftUI

/// Pickerを表示する
struct ContentView_007: ViewWithTitle {
    let title: String = "007: Pickerを表示する"
    @State private var selectedPokemonName = "Not Selected"
    let names: [String] = [
        "Snorlax",
        "Pikachu",
        "Slowpoke",
        "Meowth",
    ]
    var body: some View {
        Picker("Pokemon", selection: $selectedPokemonName) {
            ForEach(names, id: \.self) { name in
                Text(name)
            }
        }
        .pickerStyle(.inline)
        // onReceive: Publisherからの値を受け取る(値の変化を監視)
        .onReceive([selectedPokemonName].publisher) { name in
            print("selectedPokemonName = \(name)")
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

/*
 解答例
 struct ContentView: View {
     let pokemons = ["Snorlax", "Pikachu", "Slowpoke", "Meowth"]
     @State var selectedPokemon = 0

     var body: some View {
         Picker("Pokemon", selection: $selectedPokemon) {
             ForEach(pokemons, id: \.self) { pokemon in
                 Text(pokemon)
             }
         }
         .pickerStyle(WheelPickerStyle())
         .onReceive([selectedPokemon].publisher.first()) { value in
             print("SelectedPokemon: \(value)")
             print(pokemons[value])
         }
     }
 }
 */

#Preview {
    NavigationView {
        ContentView_007()
    }
}
