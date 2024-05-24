//
//  ContentView_037.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/05/24.
//

import SwiftUI

/// ハーフモーダルを表示する
struct ContentView_037: ViewWithTitle {
    let title: String = "037: ハーフモーダルを表示する"
    @State private var isShowingHalfModal = false

    var body: some View {
        Button("Show Half Modal!!") {
            isShowingHalfModal = true
        }
        .sheet(isPresented: $isShowingHalfModal) {
            Text("Half Modal!!")
                .presentationDetents([.medium])
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
             Text("Half Modal")
                 .presentationDetents([.medium])

         }
     }
 }
 */

#Preview {
    NavigationStack {
        ContentView_037()
    }
}
