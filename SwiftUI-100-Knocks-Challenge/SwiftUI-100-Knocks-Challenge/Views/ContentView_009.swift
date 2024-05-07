//
//  ContentView_009.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/05/07.
//

import SwiftUI

/// Buttonが押されたら文字を変える
struct ContentView_009: ViewWithTitle {
    let title: String = "009: Buttonが押されたら文字を変える"
    let names: [String] = ["Pikachu", "Charmander", "Bulbasaur", "Squirtle"]
    @State private var index = 0
    var body: some View {
        VStack {
            Text(names[index])
            Button("Tap Me!!") {
                index = (index + 1) % names.count
            }
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

/*
 解答例
 struct ContentView: View {
     @State var text = "Snorlax"

     var body: some View {
         VStack {
             Text(text)
             Button(action: {
                 text = "Forever"
             }) {
                 Text("Tap Me!!")
             }
         }
     }
 }
 */

#Preview {
    NavigationView {
        ContentView_009()
    }
}
