//
//  ContentView_060.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/06/12.
//

import SwiftUI

/// SearchBar(TextField) を使って検索する
struct ContentView_060: ViewWithTitle {
    let title: String = "060: SearchBar(TextField) を使って検索する"
    @State private var pokemons = ["Snorlax", "Slowpoke", "Pikachu", "Eevee"]
    @State private var filteredText = ""

    var body: some View {
        VStack {
            TextField("Type your search", text: $filteredText)
                .padding(.horizontal)
                .textFieldStyle(.roundedBorder)
                .padding(.top, 16)
            List {
                ForEach(pokemons, id: \.self) { pokemon in
                    if filteredText.isEmpty || pokemon.contains(filteredText){
                        Text(pokemon)
                    }
                }
            }
            .listStyle(.plain)
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

/*
 解答例
 struct ContentView: View {
     let pokemons: [String] = ["Snorlax", "Slowpoke", "Pikachu", "Eevee"]
     @State var text: String = ""
     var filterdPokemons: [String] {
         if text.isEmpty {
             return pokemons
         } else {
             return pokemons.filter {$0.uppercased().contains(text.uppercased())}
         }
     }

     var body: some View {
         ScrollView {
             LazyVStack{
                 TextField("Type your search",text: $text)
                     .padding(8)
                     .textFieldStyle(RoundedBorderTextFieldStyle())
                 ForEach(filterdPokemons, id: \.self) { pokemon in
                     VStack(alignment: .leading) {
                         Text(pokemon)
                             .padding(.leading, 12)
                         Divider()
                     }
                 }
             }
         }
     }
 }
*/

#Preview {
    NavigationStack {
        ContentView_060()
    }
}
