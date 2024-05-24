//
//  ContentView_038.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/05/24.
//

import SwiftUI

/// マークダウンを表示する
struct ContentView_038: ViewWithTitle {
    let title: String = "038: マークダウンを表示する"

    var body: some View {
        VStack(alignment: .leading) {
            Text("**Snorlax** is the **most** cute pokemon!")
            Text("[About Snorlax](https://en.wikipedia.org/wiki/Snorlax)")
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

/*
 解答例
 struct ContentView: View {
     var body: some View {
         Text("**Snorlax** is the **most** cute pokemon!\n[About Snorlax](https://en.wikipedia.org/wiki/Snorlax)")
     }
 }
 */

#Preview {
    NavigationStack {
        ContentView_038()
    }
}
