//
//  ContentView_034.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/05/22.
//

import SwiftUI

/// スワイプで遷移するチュートリアル画面を作る
struct ContentView_034: ViewWithTitle {
    let title: String = "034: スワイプで遷移するチュートリアル画面を作る"
    let images: [Image] = [
        Image("cat001"),
        Image("cat002"),
        Image("cat003"),
    ]

    var body: some View {
        TabView {
            ForEach(0..<images.count, id: \.self) { index in
                VStack {
                    images[index]
                        .resizable()
                        .frame(width: 200, height: 200)
                    Text("cat\(index + 1)")
                        .foregroundStyle(.white)
                        .font(.title)
                }
            }
        }
        .background(.gray)
        .tabViewStyle(.page)
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

/*
 解答例
 struct ContentView: View {
     var body: some View {
         TabView {
             ContentViewCell(imageName: "snorlax")
             ContentViewCell(imageName: "magnemite")
             ContentViewCell(imageName: "psyduck")
             ContentViewCell(imageName: "quagsire")
             ContentViewCell(imageName: "slowpoke")
         }
         .frame(maxWidth: .infinity, maxHeight: .infinity)
         .background(Color.gray)
         .tabViewStyle(.page)
         .menuIndicator(.visible)
     }
 }

 #Preview {
     ContentView()
 }
 */

#Preview {
    NavigationStack {
        ContentView_034()
    }
}
