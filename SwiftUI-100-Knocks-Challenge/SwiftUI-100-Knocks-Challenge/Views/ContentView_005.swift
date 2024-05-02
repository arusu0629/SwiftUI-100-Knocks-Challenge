//
//  ContentView_005.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/05/02.
//

import SwiftUI

/// 画像を等間隔で横に並べる
struct ContentView_005: ViewWithTitle {
    let title: String = "005: 画像を等間隔で横に並べる"
    var body: some View {
        HStack {
            ForEach(0..<5) { _ in
                Image("cat005")
                    .resizable()
                    .frame(width: 50, height: 50)
            }
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        ContentView_005()
    }
}

/*
 別解
 struct ContentView: View {
     var body: some View {
         HStack {
             Image(.icon)
                 .resizable()
                 .frame(width: 42, height: 42)
             Spacer()
             Image(.icon)
                 .resizable()
                 .frame(width: 42, height: 42)
             Spacer()
             Image(.icon)
                 .resizable()
                 .frame(width: 42, height: 42)
             Spacer()
             Image(.icon)
                 .resizable()
                 .frame(width: 42, height: 42)
             Spacer()
             Image(.icon)
                 .resizable()
                 .frame(width: 42, height: 42)
         }
         .padding(16)
     }
 }
 */
