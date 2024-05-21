//
//  ContentView_032.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/05/21.
//

import SwiftUI

/// 端末のシェイクを検知する
struct ContentView_032: ViewWithTitle {
    let title: String = "032: 端末のシェイクを検知する"
    @State private var isShake = false

    var body: some View {
        Text(isShake ? "Device Did Shake" : "Shake me!!")
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                isShake = true
            }
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
    }
}

/*
 解答例
 struct ContentView: View {
     @State var message = "Shake Me"

     var body: some View {
         Text(message)
             .onReceive(NotificationCenter.default.publisher(for: .deviceDidShakeNotification)) { _ in
                 message = "Device Did Shake"
         }
     }
 }
 */

#Preview {
    NavigationStack {
        ContentView_032()
    }
}
