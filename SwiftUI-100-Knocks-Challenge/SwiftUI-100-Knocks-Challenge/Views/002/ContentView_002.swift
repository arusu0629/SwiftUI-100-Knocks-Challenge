//
//  ContentView_002.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/05/01.
//

import SwiftUI

/// 画像をリサイズして表示(clip)
struct ContentView_002: View {
    var body: some View {
        Image("cat002")
            .resizable()
            .scaledToFill()
            .frame(width: 150, height: 200)
            .clipped()
            .background(.red) // ※画像の余白の赤部分が出ない事の確認のため
    }
}

#Preview {
    ContentView_002()
}
