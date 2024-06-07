//
//  ContentView_055.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/06/07.
//

import SwiftUI

/// TextField で表示するキーボードを指定する
struct ContentView_055: ViewWithTitle {
    let title: String = "055: TextField で表示するキーボードを指定する"
    @State private var inputText = ""

    var body: some View {
        VStack {
            TextField("Input Number", text: $inputText)
                .keyboardType(.decimalPad)
                .textFieldStyle(.roundedBorder)
            Text("Input Number: \(inputText)")
        }
        .padding()
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)

    }
}

/*
 解答例
 struct ContentView: View {
     @State var numberString = ""

     var body: some View {
         TextField("Input Number", text: $numberString)
             .keyboardType(.decimalPad)
             .textFieldStyle(RoundedBorderTextFieldStyle())
             .padding()
     }
 }
*/

#Preview {
    NavigationStack {
        ContentView_055()
    }
}
