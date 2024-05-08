//
//  ContentView_013.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/05/08.
//

import SwiftUI

/// Listのスタイルを変更する
struct ContentView_013: ViewWithTitle {
    let title: String = "013: ListのスタイルをPlainListStyleに変更する"
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
        .listStyle(PlainListStyle())
    }
}

/*
 解答例
 struct ContentView: View {
     let fruits = ["Apple", "Banana", "Orange", "Grape", "Cherry", "Peach"]

     var body: some View {
         NavigationView {
             List(fruits, id: \.self) { fruit in
                 NavigationLink(destination: SecondView(fruit: fruit)) {
                     Text(fruit)
                 }
             }
         }
     }
 }

 struct SecondView: View {
     let fruit: String

     var body: some View {
         Text(fruit)
             .navigationBarBackButtonHidden(true)
     }
 }

 */

#Preview {
    NavigationView {
        ContentView_013()
    }
}
