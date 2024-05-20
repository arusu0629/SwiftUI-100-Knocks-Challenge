//
//  ContentView_030.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/05/20.
//

import SwiftUI

/// NavigationBar を隠す
struct ContentView_030: ViewWithTitle {
    let title: String = "030: NavigationBar を隠す"
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Text("No Navigation Bar")
            Button("Dismiss") {
                presentationMode.wrappedValue.dismiss()
            }
        }
        .navigationTitle(title) // ※NavigationBar を非表示にしているのでタイトルは表示されない
        .toolbar(.hidden)
    }
}

/*
 解答例
 struct ContentView: View {
     var body: some View {
         NavigationStack {
             Text("No Navigation Bar")
                 .navigationBarTitle("Not Showing Title")
                 .navigationBarHidden(true)
         }
     }
 } */

#Preview {
    NavigationStack {
        ContentView_030()
    }
}
