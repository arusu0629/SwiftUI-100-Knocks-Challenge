//
//  ContentView_082.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/08/22.
//

import SwiftUI

/// ActivityIndicator を表示する
struct ContentView_082: ViewWithTitle {
    let title: String = "082: ActivityIndicator を表示する"
    @State private var shouldShowIndicator = false

    var body: some View {
        VStack {
            Spacer()
            if shouldShowIndicator {
                ProgressView("Loading...")
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
            }
            Spacer()
            Button(action: {
                shouldShowIndicator.toggle()
            }) {
                Text("Show or Hide Indicator")
                    .foregroundStyle(.white)
                    .padding()
                    .background(.gray)
                    .clipped()
            }
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

/*
 解答例
 struct ContentView: View {
     @State var showingIndicator = true

     var body: some View {
         ZStack {
             VStack {
                 Spacer()
                 Button {
                     showingIndicator.toggle()
                 } label: {
                     Text("Show or Hide Indicator")
                         .foregroundColor(Color.white)
                         .padding()
                         .background(Color.gray)
                         .clipped()
                 }
             }

             if showingIndicator {
                 ProgressView()
             }
         }
     }
 }
*/

#Preview {
    NavigationStack {
        ContentView_082()
    }
}
