//
//  ContentView_025.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/05/16.
//

import SwiftUI

/// 画面遷移先のViewから遷移元のメソッドを呼び出す
struct ContentView_025: ViewWithTitle {
    let title: String = "025: 画面遷移先のViewから遷移元のメソッドを呼び出す"
    @State var str = "ContentView_025_First"

    var body: some View {
        Text("ContentView_025_1st")
        NavigationLink(destination: ContentView_025_Second(parentView: self)) {
            Text("2nd View")
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }

    func changeTitle() {
        str = "ContentView_025_2nd"
    }

    struct ContentView_025_Second: View {
        var parentView: ContentView_025
        var body: some View {
            Text(parentView.str)
            Button("Change title") {
                parentView.changeTitle()
            }
        }
    }
}

/*
 解答例
 struct ContentView: View, MyProtocol {
     @State var text: String = "My Text"
     var body: some View {
         NavigationView {
             VStack {
                 Text(text)
                 NavigationLink(destination: SecondView(delegate: self)) {
                     Text("2nd View")
                 }
             }
         }
     }

     func myFunc() {
         text = "Changed Text"
     }
 }

 struct SecondView: View {
     var delegate: MyProtocol
     var body: some View {
         Button(action: {
             self.delegate.myFunc()
         }) {
             Text("ChangeText")
         }
     }
 }
 */

#Preview {
    NavigationStack {
        ContentView_025()
    }
}
