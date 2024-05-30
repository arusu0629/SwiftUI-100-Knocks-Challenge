//
//  ContentView_044.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/05/30.
//

import SwiftUI

///  SwiftUI の TextField で編集中と編集完了を検知する
struct ContentView_044: ViewWithTitle {
    let title: String = "044: SwiftUI の TextField で編集中と編集完了を検知する"
    @FocusState private var isEditing: Bool
    @State private var inputText = ""

    var body: some View {
        VStack {
            Text(isEditing ? "On Editing" : "Not On Editing")
            TextField("Placeholder", text: $inputText)                .focused($isEditing)
                .textFieldStyle(.roundedBorder)
        }
        .padding()
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

/*
 解答例
 struct ContentView : View {
     @State var userName: String = ""
     @State var onEditing: Bool = false

     var body: some View {
         VStack {
             Text(onEditing ? "On Editing" : "Not On Editing")

             TextField("Placeholder", text: $userName, onEditingChanged: { onEditing in
                 print("onEditingChanged: \(onEditing)")
                 self.onEditing = onEditing
             }, onCommit: {
                 print("onCommit")
             })
             .textFieldStyle(RoundedBorderTextFieldStyle())
             .padding()
         }
     }
 }
 */

#Preview {
    NavigationStack {
        ContentView_044()
    }
}
