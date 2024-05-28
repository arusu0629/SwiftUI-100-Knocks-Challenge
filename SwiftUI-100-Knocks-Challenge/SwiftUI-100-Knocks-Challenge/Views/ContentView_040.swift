//
//  ContentView_040.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/05/28.
//

import SwiftUI

/// マークダウンのリンクの色を赤色に変える
struct ContentView_040: ViewWithTitle {
    let title: String = "040: マークダウンのリンクの色を赤色に変える"
    let markdownText = """
**Snorlax** is the **most** cute pokemon!
[About Snorlax](https://en.wikipedia.org/wiki/Snorlax)
"""

    var body: some View {
        VStack {
            if let attributedString = try? AttributedString(
                markdown: markdownText,
                options: .init(interpretedSyntax: .inlineOnlyPreservingWhitespace)
            ) {
                Text(makeAttributedStringWithRedLinks(from: attributedString))
            }
            else {
                Text("Failed to load markdown")
            }
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }

    private func makeAttributedStringWithRedLinks(from attributedString: AttributedString) -> AttributedString {
        var modifiedAttributedString = attributedString
        for run in attributedString.runs {
            if run.link != nil {
                modifiedAttributedString[run.range].foregroundColor = .red
            }
        }
        return modifiedAttributedString
    }
}

/*
 解答例
 struct ContentView: View {
     let markdownText: String = "**Snorlax** is the **most** cute pokemon!\n[About Snorlax](https://en.wikipedia.org/wiki/Snorlax)"

     var body: some View {
         Text(LocalizedStringKey(markdownText))
             .tint(Color.red)
     }
 }
 */

#Preview {
    NavigationStack {
        ContentView_040()
    }
}
