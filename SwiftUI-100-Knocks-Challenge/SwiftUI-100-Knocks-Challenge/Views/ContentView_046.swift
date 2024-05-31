//
//  ContentView_046.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/05/31.
//

import SwiftUI

/// SwiftUI で View の上に View を重ねる
struct ContentView_046: ViewWithTitle {
    let title: String = "046: View の上に View を重ねる"

    var body: some View {
        ZStack {
            Image("cat001")
                .resizable()
                .frame(width: 200, height: 200)
                .opacity(0.5)
                .background(.black)
            Text("@arusu0629")
                .foregroundStyle(.white)
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

/*
 解答例
 struct ContentView: View {
     var body: some View {
         Image(.icon)
             .resizable()
             .frame(width: 200, height: 200)
             .overlay(
                 Text("@takoikatakotako")
                     .foregroundColor(Color.white)
                     .font(Font.system(size: 20).bold())
                     .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                     .background(Color.black)
                     .opacity(0.5)
             )
     }
 }
 */

#Preview {
    NavigationStack {
        ContentView_046()
    }
}
