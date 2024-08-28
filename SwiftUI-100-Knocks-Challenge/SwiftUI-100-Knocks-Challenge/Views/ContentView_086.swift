//
//  ContentView_086.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/08/28.
//

import SwiftUI

/// Identifiableに適合していないStructでListを使う
struct ContentView_086: ViewWithTitle {
    let title: String = "086:  Identifiableに適合していないStructでListを使う"
    let pokemons: [Pokemon] = [
        Pokemon(name: "Pikachu", type: "Electric"),
        Pokemon(name: "Charmander", type: "Fire"),
        Pokemon(name: "Squirtle", type: "Water"),
    ]

    var body: some View {
        VStack {
            List(pokemons, id: \.name) { pokemon in
                Text(pokemon.name)
            }
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }

    struct Pokemon {
        let name: String
        let type: String
    }

}

/*
 解答例
 struct ContentView: View {
     @State var selection: Int = 0

     var body: some View {
         TabView(selection: $selection) {
             FirstView(selection: $selection)
                 .tabItem {
                     Image(systemName: "house")
                         .renderingMode(.template)
                     Text("FirstView")
                 }
                 .tag(0)
             SecondView(selection: $selection)
                 .tabItem {
                     Image(systemName: "books.vertical")
                         .renderingMode(.template)
                     Text("SecondView")
                 }
                 .tag(1)
         }
     }
 }

 struct FirstView: View {
     @Binding var selection: Int
     var body: some View {
         VStack {
             Text("FirstView")
             Button {
                 selection = 1
             } label: {
                 Text("Go to SecondView")
             }
         }
     }
 }

 struct SecondView: View {
     @Binding var selection: Int
     var body: some View {
         VStack {
             Text("SecondView")
             Button {
                 selection = 0
             } label: {
                 Text("Go to FirstView")
             }
         }
     }
 }
*/

#Preview {
    NavigationStack {
        ContentView_086()
    }
}
