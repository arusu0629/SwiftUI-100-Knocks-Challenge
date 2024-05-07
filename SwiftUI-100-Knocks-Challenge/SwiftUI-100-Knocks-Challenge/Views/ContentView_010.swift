//
//  ContentView_010.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/05/07.
//

import SwiftUI

/// Listを使ってセクションごとに表示する
struct ContentView_010: ViewWithTitle {
    let title: String = "010: Listを使ってセクションごとに表示する"
    let normalPokemons = ["Meowth", "Ditto"]
    let firePokemons: [String] = ["Vulpix", "Arcanine", "Charmander"]
    var body: some View {
        List {
            Section("NORMAL") {
                ForEach(normalPokemons, id: \.self) { name in
                    Text(name)
                }
            }
            Section("FIRE") {
                ForEach(firePokemons, id: \.self) { name in
                    Text(name)
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
     var body: some View {
         List {
             Section("Normal") {
                 Text("Meowth")
                 Text("Ditto")
             }

             Section("Fire") {
                 Text("Vulpix")
                 Text("Arcanine")
                 Text("Charmander")
             }
         }
         .listStyle(.grouped)
     }
 }
 */

#Preview {
    NavigationView {
        ContentView_010()
    }
}
