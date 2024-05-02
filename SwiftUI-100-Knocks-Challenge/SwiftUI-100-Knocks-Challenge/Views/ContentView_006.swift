//
//  ContentView_006.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/05/02.
//

import SwiftUI

/// NavigationViewを使いラージタイトルを表示する
struct ContentView_006: ViewWithTitle {
    let title: String = "006: NavigationViewを使いラージタイトルを表示する"
    var body: some View {
        VStack {
            Image("cat006")
                .resizable()
                .frame(width: 150, height: 150)
            Text("Here's the image of an anime-style Munchkin cat with vibrant blue and pink fur, sitting in a colorful garden.")
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.large)
    }
}

/* 
 解答例
 struct ContentView: View {
     var body: some View {
         NavigationStack {
             VStack {
                 Image(.icon)
                     .resizable()
                     .frame(width: 150, height: 150)

                 Text("Snorlax is the most plpular Pokemon")
             }
             .navigationBarTitleDisplayMode(.large)
             .navigationTitle("Snorlax")
         }
     }
 }
 */

#Preview {
    NavigationView {
        ContentView_006()
    }
}
