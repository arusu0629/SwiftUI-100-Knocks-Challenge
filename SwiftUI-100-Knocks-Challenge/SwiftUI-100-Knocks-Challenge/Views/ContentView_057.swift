//
//  ContentView_057.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/06/11.
//

import SwiftUI

/// List を EditMode にして並び替える
struct ContentView_057: ViewWithTitle {
    let title: String = "057: List を EditMode にして並び替える"
    @State private var pokemons = ["Snorlax", "Pikachu", "Slowpoke"]

    var body: some View {
        List() {
            ForEach(pokemons, id: \.self) { pokemon in
                Text(pokemon)
            }
            .onMove { pokemons.move(fromOffsets: $0, toOffset: $1) }
        }
        .toolbar {
            EditButton()
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

/*
 解答例
 struct ContentView: View {
     @State var pokemons: [Pokemon] = [
         Pokemon(id: 143, name: "Snorlax"),
         Pokemon(id: 52, name: "Meowth"),
         Pokemon(id: 25, name: "Pikachu"),
     ]

     var body: some View {
         NavigationStack {
             List {
                 ForEach(pokemons) { pokemon in
                     Text(pokemon.name)
                 }.onMove { (indexSet, index) in
                     pokemons.move(fromOffsets: indexSet, toOffset: index)
                 }
             }
             .navigationBarTitle(Text("Pokemon List"))
             .navigationBarItems(trailing: EditButton())
         }
     }
 }

 struct Pokemon: Identifiable {
     var id: Int
     let name: String
 }

*/

#Preview {
    NavigationStack {
        ContentView_057()
    }
}
