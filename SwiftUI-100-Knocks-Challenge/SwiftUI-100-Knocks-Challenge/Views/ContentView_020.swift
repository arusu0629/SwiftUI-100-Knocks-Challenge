//
//  ContentView_020.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/05/10.
//

import SwiftUI

/// Text中の文字の太さや色を変える
struct ContentView_020: ViewWithTitle {
    let title: String = "020: Text中の文字の太さや色を変える"

    var body: some View {
        VStack(alignment: .leading) {
            (
                Text("I")
                    .fontWeight(.bold) +
                Text(" ♥ ")
                    .foregroundStyle(.red) +
                Text("Snorlax")
                    .fontWeight(.bold) +
                Text("!")
            )
            (
                Text("Snorlax ")
                    .fontWeight(.bold)
                    .foregroundStyle(.red) +
                Text("is most ")
                    .fontWeight(.bold)
                    .foregroundStyle(.blue) +
                Text("cute & cool&")
                    .fontWeight(.bold)
                    .foregroundStyle(.green)
            )
            (
                Text("powerful ")
                    .fontWeight(.bold)
                    .foregroundStyle(.green) +
                Text("Pokemon.")
                    .fontWeight(.bold)
                    .foregroundStyle(.yellow)
            )
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

/*
 解答例
 struct ContentView: View {
     var body: some View {
         VStack {
             Text("I")
                 .font(.system(size: 20).bold())
             + Text(" ❤️ ")
                 .foregroundStyle(Color.red)
             + Text("Snorlax")
                 .foregroundStyle(Color.black)
                 .font(.system(size: 20).bold())
             + Text("!\n")
             + Text("Snorlax ")
                 .foregroundStyle(Color.red)
                 .font(.system(size: 20).bold())
             + Text("is most ")
                 .foregroundStyle(Color.blue)
                 .font(.system(size: 20).bold())
             + Text("cute & cool& powerful .")
                 .foregroundStyle(Color.green)
                 .font(.system(size: 20).bold())
             + Text("Pokemon.")
                 .foregroundStyle(Color.yellow)
                 .font(.system(size: 20).bold())
         }
     }
 }
 */

#Preview {
    NavigationStack {
        ContentView_020()
    }
}
