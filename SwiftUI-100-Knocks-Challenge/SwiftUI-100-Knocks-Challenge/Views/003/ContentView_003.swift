//
//  ContentView_003.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/05/01.
//

import SwiftUI

/// 画像を丸く切り取る
struct ContentView_003: View {
    var body: some View {
        Image("cat003")
            .resizable()
            .frame(width: 150, height: 150)
            .clipShape(Circle())
    }
}

#Preview {
    ContentView_003()
}
