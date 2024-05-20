//
//  ContentView_029.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/05/20.
//

import SwiftUI

/// 全画面で Sheet を表示する
struct ContentView_029: ViewWithTitle {
    let title: String = "029: 全画面で Sheet を表示する"
    @State private var isPresented = false

    var body: some View {
        Button("Tap me!") {
            isPresented = true
        }
        .fullScreenCover(isPresented: $isPresented) {
            ContentView_029_secondView(isPresented: $isPresented)
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }

    struct ContentView_029_secondView: View {
        @Binding var isPresented: Bool

        var body: some View {
            Button("Dismiss") {
                isPresented = false
            }
        }
    }
}

/*
 解答例
 struct ContentView: View {
     @State var showingCover = false
     var body: some View {
         VStack {
             Button(action: {
                 showingCover = true
             }) {
                 Text("Tap me!")
             }
         }
         .frame(maxWidth: .infinity, maxHeight: .infinity)
         .background(Color.gray)
         .fullScreenCover(isPresented: $showingCover) {
             SecondView()
         }
     }
 }
 */

#Preview {
    NavigationStack {
        ContentView_029()
    }
}
