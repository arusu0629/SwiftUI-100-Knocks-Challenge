//
//  ContentView_003.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/05/01.
//

import SwiftUI

/// 画像を丸く切り取る
struct ContentView_003: ViewWithTitle {
    let title: String = "003: 画像を丸く切り取る"
    var body: some View {
        Image("cat003")
            .resizable()
            .frame(width: 150, height: 150)
            .clipShape(Circle())
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        ContentView_003()
    }
}
