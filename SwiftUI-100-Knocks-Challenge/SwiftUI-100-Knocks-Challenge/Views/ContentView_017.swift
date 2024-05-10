//
//  ContentView_017.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/05/09.
//

import SwiftUI

/// SwiftUIでアラートとシートを出し分ける
/// 数字が入力されたらシートを表示
/// 数字以外が入力されたらアラートを表示
struct ContentView_017: ViewWithTitle {
    enum DisplayMode {
        case none
        case sheet
        case alert
    }

    let title: String = "017: アラートとシートを出し分ける"
    @State private var text = ""
    @State private var displayMode: DisplayMode = .none

    var body: some View {
        VStack {
            TextField("Input Number", text: $text)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Show Sheet") {
                if let _ = Int(text) {
                    displayMode = .sheet
                } else {
                    displayMode = .alert
                }
            }
            .sheet(isPresented: Binding<Bool>(
                get: { displayMode == .sheet },
                set: { _ in displayMode = .none }
            )) {
                Text("Input number is \(text)")
            }
            .alert("Alert", isPresented: Binding<Bool>(
                get: { displayMode == .alert },
                set: { _ in displayMode = .none }
            )) {
                Button("OK") {
                    print("pressed ok")
                }
            } message: {
                Text("Please enter a valid number")
            }
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

/*
 解答例
 struct ContentView: View {
     @State var numberString: String = ""
     @State var showingAlert: Bool = false
     @State var showingSheet: Bool = false

     var body: some View {
         VStack {
             TextField("Input Number", text: $numberString)
                 .padding()
                 .textFieldStyle(RoundedBorderTextFieldStyle())

             Button(action: {
                 // Can numberString convert to Double?
                 guard Double(numberString) != nil else {
                     showingAlert = true
                     return
                 }
                 showingSheet = true
             }) {
                 Text("Show Sheet")
             }
         }
         .alert(Text("Error"), isPresented: $showingAlert, actions: {
             Button("Close", role: .none) {
                 print("Close")
             }
         }, message: {
             Text("Please Input Number")
         })
         .sheet(isPresented: $showingSheet) {
             Text("\(numberString) can convert to Double")
         }
     }
 }
 */

#Preview {
    NavigationView {
        ContentView_017()
    }
}
