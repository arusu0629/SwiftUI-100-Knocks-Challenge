//
//  ContentView_028.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/05/20.
//

import SwiftUI

/// Sheet を表示する
struct ContentView_028: ViewWithTitle {
    let title: String = "028: Sheet を表示する"
    @State private var isPresented = false

    var body: some View {
        Button("Tap me!") {
            isPresented = true
        }
        .sheet(isPresented: $isPresented) {
            Text("Sheet")
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

/*
 解答例
 struct ContentView: View {
     @State var showingSheet = false
     var body: some View {
         VStack {
             Button(action: {
                 showingSheet = true
             }) {
                 Text("Tap me!")
             }
         }
         .sheet(isPresented: $showingSheet) {
             Text("Sheet!!")
         }
     }
 }
 */

#Preview {
    NavigationStack {
        ContentView_028()
    }
}
