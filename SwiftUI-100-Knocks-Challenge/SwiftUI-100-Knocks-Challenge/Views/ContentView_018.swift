//
//  ContentView_018.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/05/10.
//

import SwiftUI

/// Buttonからプッシュ遷移をする
/// ※NavigationLinkを無効にする
struct ContentView_018: ViewWithTitle {
    let title: String = "018: Buttonからプッシュ遷移をする"
    @State private var isActive = false

    // ※親ビューで NavigationStack を使用している前提
    var body: some View {
        Button("Tap Me!!") {
            isActive = true
        }
        .navigationDestination(isPresented: $isActive) {
            DetailView()
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }

    struct DetailView: View {
        var body: some View {
            Text("Detail")
        }
    }
}

/*
 解答例
 struct ContentView: View {
     @State var isActive: Bool = false

     var body: some View {
         NavigationStack {
             VStack {
                 Button(action: {
                     isActive = true
                 }) {
                     Text("Tap Me!!")
                 }
             }
             .navigationDestination(isPresented: $isActive) {
                 Text("SecondView")
             }
         }
     }
 }
 */

#Preview {
    NavigationStack {
        ContentView_018()
    }
}
