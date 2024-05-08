//
//  ContentView_012.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/05/08.
//

import SwiftUI

/// NavigationViewの戻るボタンを非表示にする
struct ContentView_012: ViewWithTitle {
    let title: String = "012: NavigationViewの戻るボタンを非表示にする"
    let fruits = ["Apple", "Banana", "Orange", "Grape", "Cherry", "Peach"]
    var body: some View {
        List(fruits, id: \.self) { fruit in
            NavigationLink(destination: DetailView(fruit: fruit)) {
                Text(fruit)
            }
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }

    /// 遷移先のビュー
    struct DetailView: View {

        let fruit: String

        var body: some View {
            Text(fruit)
                .navigationBarBackButtonHidden() // 戻るボタンを非表示にする
        }
    }
}

/*
 解答例
 struct ContentView: View {
     let fruits = ["Apple", "Banana", "Orange", "Grape", "Cherry", "Peach"]

     var body: some View {
         NavigationView {
             List(fruits, id: \.self) { fruit in
                 NavigationLink(destination: SecondView(fruit: fruit)) {
                     Text(fruit)
                 }
             }
         }
     }
 }

 struct SecondView: View {
     let fruit: String

     var body: some View {
         Text(fruit)
             .navigationBarBackButtonHidden(true)
     }
 }

 */

#Preview {
    NavigationView {
        ContentView_012()
    }
}
