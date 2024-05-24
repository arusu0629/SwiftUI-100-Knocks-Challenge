//
//  ContentView_039.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/05/24.
//

import SwiftUI

/// 変数に格納したマークダウンを表示する
struct ContentView_039: ViewWithTitle {
    let title: String = "039: 変数に格納したマークダウンを表示する"
    let markdownText = """
**Snorlax** is the **most** cute pokemon!
[About Snorlax](https://en.wikipedia.org/wiki/Snorlax)
"""

    var body: some View {
        VStack {
            if let str = try? AttributedString(markdown: markdownText, options: .init(interpretedSyntax: .inlineOnlyPreservingWhitespace)) {
                Text(str)
            }
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

/*
 解答例
 struct ContentView: View {
     let markdownText: String = "**Snorlax** is the **most** cute pokemon!\n[About Snorlax](https://en.wikipedia.org/wiki/Snorlax)"

     var body: some View {
         Text(LocalizedStringKey(markdownText))
     }
 }
 */

#Preview {
    NavigationStack {
        ContentView_039()
    }
}
