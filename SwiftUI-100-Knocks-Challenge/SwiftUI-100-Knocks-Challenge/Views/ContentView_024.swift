//
//  ContentView_024.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/05/15.
//

import SwiftUI

/// リストのセルをタップするとアラートを表示させる
struct ContentView_024: ViewWithTitle {
    let title: String = "024: リストのセルをタップするとアラートを表示させる"
    @State private var names = ["Snorla", "Pikachu", "Psyduck", "Blastoise", "Slowpoke"]
    @State private var tappedNames = ""

    var body: some View {
        List {
            ForEach(names, id: \.self) { name in
                Button(name) {
                    tappedNames = name
                }
            }
        }
        .alert("Alert Title", isPresented: Binding<Bool>(
            get: { !tappedNames.isEmpty },
            set: { _ in tappedNames = "" }
        )) {
            Button("OK", role: .cancel) {
                print("You tapped OK")
            }
        } message: {
            Text("You tapped \(tappedNames)")
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

/*
 解答例
 struct ContentView: View {
     @State var showingAlert = false
     @State var pokemon: Pokemon?

     let pokemons: [Pokemon] = [
         Pokemon(id: 143, name: "Snorlax"),
         Pokemon(id: 25, name: "Pikachu"),
         Pokemon(id: 138, name: "Psyduck"),
         Pokemon(id: 9, name: "Blastoise"),
         Pokemon(id: 79, name: "Slowpoke")]

     var body: some View {
         List(pokemons) { pokemon in
             Button {
                 self.pokemon = pokemon
                 showingAlert = true
             } label: {
                 Text(pokemon.name)
             }
         }
         .alert("Alert", isPresented: $showingAlert, presenting: pokemon) { pokemon in
             Button(pokemon.name, role: .none) {
                 print("Close")
             }
         } message: { pokemon in
             Text(pokemon.name)
         }
     }
 }
 */

#Preview {
    NavigationStack {
        ContentView_024()
    }
}
