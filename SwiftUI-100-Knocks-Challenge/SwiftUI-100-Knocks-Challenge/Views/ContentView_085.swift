//
//  ContentView_085.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/08/28.
//

import SwiftUI

/// TabViewのタブをコードから動的に切り替える
struct ContentView_085: ViewWithTitle {
    let title: String = "085: TabViewのタブをコードから動的に切り替える"
    @State private var selectedTab = 0

    var body: some View {
        VStack {
            TabView(selection: $selectedTab) {
                ContentView_085_FirstView(selectedTab: $selectedTab)
                    .tabItem {
                        Label("First", systemImage: "1.circle")
                    }
                    .tag(0)
                ContentView_085_SecondView(selectedTab: $selectedTab)
                    .tabItem {
                        Label("Second", systemImage: "2.circle")
                    }
                    .tag(1)
            }
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }

    struct ContentView_085_FirstView: View {

        @Binding var selectedTab: Int

        var body: some View {
            VStack {
                Text("FirstView")
                Button(action: {
                    selectedTab = 1
                }) {
                    Text("Go to SecondView")
                }
            }
        }
    }


    struct ContentView_085_SecondView: View {

        @Binding var selectedTab: Int

        var body: some View {
            VStack {
                Text("SecondView")
                Button(action: {
                    selectedTab = 0
                }) {
                    Text("Go to FirstView")
                }
            }
        }
    }
}

/*
 解答例
 struct ContentView: View {
     @State var selection: Int = 0

     var body: some View {
         TabView(selection: $selection) {
             FirstView(selection: $selection)
                 .tabItem {
                     Image(systemName: "house")
                         .renderingMode(.template)
                     Text("FirstView")
                 }
                 .tag(0)
             SecondView(selection: $selection)
                 .tabItem {
                     Image(systemName: "books.vertical")
                         .renderingMode(.template)
                     Text("SecondView")
                 }
                 .tag(1)
         }
     }
 }

 struct FirstView: View {
     @Binding var selection: Int
     var body: some View {
         VStack {
             Text("FirstView")
             Button {
                 selection = 1
             } label: {
                 Text("Go to SecondView")
             }
         }
     }
 }

 struct SecondView: View {
     @Binding var selection: Int
     var body: some View {
         VStack {
             Text("SecondView")
             Button {
                 selection = 0
             } label: {
                 Text("Go to FirstView")
             }
         }
     }
 }
*/

#Preview {
    NavigationStack {
        ContentView_085()
    }
}
