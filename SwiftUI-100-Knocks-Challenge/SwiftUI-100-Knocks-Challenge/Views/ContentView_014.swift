//
//  ContentView_014.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/05/08.
//

import SwiftUI

/// Alertを表示する
struct ContentView_014: ViewWithTitle {
    let title: String = "014: Alertを表示する"
    @State private var isPresented = false
    var body: some View {
        Button("Show Alert") {
            isPresented = true
        }
        .alert(isPresented: $isPresented) {
            Alert(
                title: Text("Title"),
                message: Text("Message")
            )
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

/*
 解答例
 struct ContentView: View {
     @State var showingAlert = false

     var body: some View {
         VStack {
             Button {
                 showingAlert = true
             } label: {
                 Text("Show Alert")
             }
         }
         .alert("Alert Title", isPresented: $showingAlert) {
             Button("Done", role: .none) {
                 print("Done")
             }
             Button("Cancel", role: .cancel) {
                 print("Cancel")
             }
         } message: {
             Text("Message")
         }
     }
 }

 */

#Preview {
    NavigationView {
        ContentView_014()
    }
}
