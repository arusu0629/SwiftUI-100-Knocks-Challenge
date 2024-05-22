//
//  ContentView_035.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/05/22.
//

import SwiftUI

/// 閉じることができないモーダルを表示する
struct ContentView_035: ViewWithTitle {
    let title: String = "035: 閉じることができないモーダルを表示する"
    @State private var showModal = false

    var body: some View {
        Button("Show Modal!!") {
            showModal = true
        }
        .sheet(isPresented: $showModal) {
            Button("Close") {
                showModal = false
            }
            .interactiveDismissDisabled(true)
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

         Button(action: {
             showingSheet = true
         }, label: {
             Text("Show Modal!")
         })
         .sheet(isPresented: $showingSheet) {
             ModalView()
         }
     }
 }

 struct ModalView: View {
     @Environment(\.dismiss) var dismiss

     var body: some View {
         Button(action: {
             dismiss()
         }, label: {
             Text("Close")
         })
         .interactiveDismissDisabled(true)
     }
 }
 */

#Preview {
    NavigationStack {
        ContentView_035()
    }
}
