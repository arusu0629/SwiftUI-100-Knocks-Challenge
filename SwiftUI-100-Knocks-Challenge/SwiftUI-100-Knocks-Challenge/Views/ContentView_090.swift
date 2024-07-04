//
//  ContentView_090.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/07/03.
//

import SwiftUI

/// 画像をピンチイン/アウトで縮小/拡大する
struct ContentView_090: ViewWithTitle {
    let title: String = "090: 画像をピンチイン/アウトで縮小/拡大する"
    @State private var currentScale: CGFloat = 1.0
    @State private var lastScale: CGFloat = 1.0

    var body: some View {
        VStack {
            Image("cat001")
                .resizable()
                .scaledToFit()
                .scaleEffect(currentScale)
                .gesture(
                    MagnificationGesture()
                        .onChanged { value in
                            currentScale = lastScale * value
                        } 
                        .onEnded { value in
                            lastScale = currentScale
                        }
                )
                .frame(width: 150, height: 150)
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

/*
 解答例
 struct ContentView: View {
     @State var scale: CGFloat = 1.0

     var body: some View {
         Image(.icon)
             .resizable()
             .scaleEffect(scale)
             .frame(width: 200, height: 200)
             .gesture(MagnificationGesture()
                 .onChanged { value in
                     scale = value.magnitude
                 }
             )
     }
 }
*/

#Preview {
    NavigationStack {
        ContentView_090()
    }
}
