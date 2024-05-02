//
//  001.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/05/01.
//

import SwiftUI

/// 画像をリサイズして表示(fit)
struct ContentView_001: ViewWithTitle {
    let title: String = "001: 画像をリサイズして表示(fit)"
    var body: some View {
        Image("cat001")
            .resizable() // 画像をリサイズ可能にする。これをしないと画像サイズのまま表示しようとして 150x200 の大きさで表示できない
            .scaledToFit()
            .frame(width: 150, height: 200)
            .background(.red)
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        ContentView_001()
    }
}
