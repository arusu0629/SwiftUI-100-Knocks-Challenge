//
//  ContentView_016.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/05/09.
//

import SwiftUI

/// Button内の画像やテキストの色を変えない
/// Buttonが押されたら文字を変更する
/// Button内の画像やテキストの色は変更しない
struct ContentView_016: ViewWithTitle {
    let title: String = "016: Button内の画像やテキストの色を変えない"
    @State private var text = "Snorlax"
    var body: some View {
        VStack {
            Text(text)
            Button(action: {
                text = "Cat"
            }) {
                HStack {
                    Image("cat001")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                    Text("Tap Me!!")
                }
                .padding(10)
                .border(Color.black)
            }
            .buttonStyle(.plain)
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

/*
 解答例
 struct ContentView: View {
     @State var text = "Snorlax"

     var body: some View {
         VStack {
             Text(text)
             Button(action: {
                 text = "Forever"
             }) {
                 HStack {
                     Image(.icon)
                         .resizable()
                         .scaledToFill()
                         .frame(width: 50, height: 50)
                     Text("Tap Me!!")
                 }
                 .padding()
                 .border(Color.gray, width: 2)
             }
             .buttonStyle(PlainButtonStyle())
         }
     }
 }
 */

#Preview {
    NavigationView {
        ContentView_016()
    }
}
