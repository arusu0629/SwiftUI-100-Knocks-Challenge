//
//  ContentView_058.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/06/12.
//

import SwiftUI

/// List のセル全体をタップ可能にする
struct ContentView_058: ViewWithTitle {
    let title: String = "058: List のセル全体をタップ可能にする"
    @State private var pokemons = ["Snorlax", "Pikachu", "Slowpoke"]

    var body: some View {
        List() {
            ForEach(pokemons, id: \.self) { pokemon in
                HStack {
                    Text(pokemon)
                    Spacer()
                }
                // List 内のセル全体をタップ可能にする
                .contentShape(Rectangle())
                .onTapGesture {
                    print("tapped \(pokemon)")
                }
            }
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

/*
 解答例
 struct ContentView: View {
     let pokemons: [String] = ["Snorlax", "Pikachu", "Slowpoke"]
     var body: some View {
         List(pokemons, id: \.self) {pokemon in
             HStack {
                 Text(pokemon)
                 Spacer()
             }
             .contentShape(Rectangle())
             .onTapGesture {
                 print(pokemon)
             }
         }
     }
 }

 #Preview {
     ContentView()
 }
*/

#Preview {
    NavigationStack {
        ContentView_058()
    }
}
