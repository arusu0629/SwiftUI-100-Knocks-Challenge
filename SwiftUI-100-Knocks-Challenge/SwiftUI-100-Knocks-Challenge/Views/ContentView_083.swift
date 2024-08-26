//
//  ContentView_083.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/08/26.
//

import SwiftUI

/// 少しカスタマイズした ActivityIndicator を表示する
struct ContentView_083: ViewWithTitle {
    let title: String = "083: 少しカスタマイズした ActivityIndicator を表示する"
    @State private var shouldShowIndicator = true

    var body: some View {
        VStack {
            Spacer()
            if shouldShowIndicator {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 70, height: 70)
                        .foregroundColor(.gray)
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                        .tint(.white) // プログレスビューを白色に設定
                        .scaleEffect(1.5) // インジケーターを大きくする
                }
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
                     .progressViewStyle(.circular)
                     .padding(12)
                     .tint(Color.white)
                     .background(Color.gray.opacity(0.6))
                     .cornerRadius(8)
                     .scaleEffect(1.6)
             }
         }
     }
 }
*/

#Preview {
    NavigationStack {
        ContentView_083()
    }
}
