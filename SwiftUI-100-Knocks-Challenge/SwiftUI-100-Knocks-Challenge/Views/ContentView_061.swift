//
//  ContentView_061.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/08/21.
//

import SwiftUI

/// SearchBar(TextField) にクリアボタンをつける(skip)
struct ContentView_061: ViewWithTitle {
    let title: String = "061: SearchBar(TextField) にクリアボタンをつける"
    @State private var pokemons = ["Snorlax", "Slowpoke", "Pikachu", "Eevee"]
    @State private var filteredText = ""

    var body: some View {
        VStack {
            ZStack(alignment: .trailing) {
                TextField("Type your search", text: $filteredText)
                    .textFieldStyle(.roundedBorder)
                if !filteredText.isEmpty {
                    Button(action: {
                        filteredText = ""
                    }) {
                        Image(systemName: "delete.left")
                            .foregroundColor(.gray)
                    }
                    .padding(.trailing, 8)
                }
            }
            .padding(8)
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
     @State var text: String = ""

     let pokemons: [String] = ["Snorlax", "Slowpoke", "Pikachu", "Eevee"]

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
                 ZStack(alignment: .trailing) {
                     TextField("Type your search",text: $text)
                         .textFieldStyle(RoundedBorderTextFieldStyle())

                     if !text.isEmpty{
                         Button(action:
                                 {
                             self.text = ""
                         })
                         {
                             Image(systemName: "delete.left")
                                 .foregroundColor(Color(UIColor.opaqueSeparator))
                         }
                         .padding(.trailing, 8)
                     }
                 }
                 .padding(8)

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
        ContentView_061()
    }
}
