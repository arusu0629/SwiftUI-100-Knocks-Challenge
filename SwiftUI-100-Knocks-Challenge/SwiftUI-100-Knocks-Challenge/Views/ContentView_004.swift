//
//  ContentView_004.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/05/02.
//

import SwiftUI

/// 画像を丸く切り取り、枠をつける
struct ContentView_004: ViewWithTitle {
    let title: String = "004: 画像を丸く切り取り、枠をつける"
    var body: some View {
        Image("cat004")
            .resizable()
            .frame(width: 150, height: 150)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.black, lineWidth: 4))
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        ContentView_004()
    }
}
