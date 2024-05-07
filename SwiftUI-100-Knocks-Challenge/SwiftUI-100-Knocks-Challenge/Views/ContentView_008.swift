//
//  ContentView_008.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/05/07.
//

import SwiftUI

/// TabViewを使って画面を切り替える
struct ContentView_008: ViewWithTitle {
    let title: String = "008: TabViewを使って画面を切り替える"
    var body: some View {
        TabView() {
            Text("First Tab").tabItem { Label("First", systemImage: "1.square") }.tag(1)
            Text("Second Tab").tabItem { Label("Second", systemImage: "2.square") }.tag(2)
            Text("Third Tab").tabItem { Label("Third", systemImage: "3.square") }.tag(3)
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

/*
 解答例
 struct ContentView: View {
     var body: some View {
         TabView {
             Text("First Tab")
                 .tabItem {
                     Image(systemName: "1.square.fill")
                     Text("First")
                 }
             Text("Second Tab")
                 .tabItem {
                     Image(systemName: "2.square.fill")
                     Text("Second")
                 }
             Text("Third Tab")
                 .tabItem {
                     Image(systemName: "3.square.fill")
                     Text("Third")
                 }
         }
         .font(.headline)
     }
 }
 */

#Preview {
    NavigationView {
        ContentView_008()
    }
}
