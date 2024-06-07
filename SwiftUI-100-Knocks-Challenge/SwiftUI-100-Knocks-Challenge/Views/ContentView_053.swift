//
//  ContentView_053.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/06/07.
//

import SwiftUI

/// 画像を横に並べてスクロール可能な UI を表示する
struct ContentView_053: ViewWithTitle {
    let title: String = "053: 画像を横に並べてスクロール可能な UI を表示する"
    let imageNames = ["cat001", "cat002", "cat003", "cat004", "cat005", "cat006",]

    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(imageNames, id: \.self) { name in
                    VStack {
                        Image(name)
                            .resizable()
                            .frame(width: 100, height: 100)
                        Text(name)
                    }
                }
            }
        }
        .scrollIndicators(.hidden)
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

/*
 解答例
 struct ContentView: View {
     var body: some View {
         let pokemons = ["pikachu", "slowpoke", "bellsprout", "ditto", "snorlax", "eevee", "magikarp"]

         ScrollView(.horizontal, showsIndicators: false) {
             LazyHStack(spacing: 12) {
                 ForEach(pokemons, id: \.self) { pokemon in
                     Image(pokemon)
                         .resizable()
                         .frame(width: 80, height: 80)
                         .background(Color(UIColor.lightGray))
                 }
             }
             .padding(.horizontal, 12)
         }
         .frame(height: 80)
     }
 }

 */

#Preview {
    NavigationStack {
        ContentView_053()
    }
}
