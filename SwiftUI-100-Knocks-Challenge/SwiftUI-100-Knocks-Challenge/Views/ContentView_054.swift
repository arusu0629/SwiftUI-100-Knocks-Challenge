//
//  ContentView_054.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/06/07.
//

import SwiftUI

/// ボタンを有効にしたり無効にしたりする
struct ContentView_054: ViewWithTitle {
    let title: String = "054: ボタンを有効にしたり無効にしたりする"
    @State private var isShowingPopup = false
    @State private var isEnabledButton = true

    var body: some View {
        ZStack {
            VStack {
                Toggle(isOn: $isEnabledButton) {
                    Text("isEnabled: \(isEnabledButton.description)")
                }
                Button(action: {
                    isShowingPopup = true
                }, label: {
                    let buttonText = "Tap Me!!" + (isEnabledButton ? "(Enabled)" : "(Disabled)")
                    Text(buttonText)
                        .frame(width: 180, height: 60)
                        .background(isEnabledButton ? .orange : .gray)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                })
                .disabled(!isEnabledButton)
            }
            .padding()

            if isShowingPopup {
                ContentView_054_PopupView(isShowingPopup: $isShowingPopup)
            }
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)

    }

    struct ContentView_054_PopupView: View {
        @Binding var isShowingPopup: Bool

        var body: some View {

            VStack {
                Text("Cat001")
                Image("cat001")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 200)
                Button("Close") {
                    withAnimation {
                        isShowingPopup = false
                    }
                }
            }
            .frame(width: 300, height: 350)
            .background(.gray)
            .clipShape(RoundedRectangle(cornerRadius: 25))
        }
    }
}

/*
 解答例
 struct ContentView: View {
     @State var enable: Bool = true

     var body: some View {
         VStack {
             Toggle(isOn: $enable) {
                 Text("isEnable: \(enable.description)")
             }

             Button {
                 print("Tapped!!")
             } label: {
                 Text("Tap Me!!(\(enable ? "Enable": "Disable"))")
                     .foregroundColor(Color.white)
                     .padding()
                     .background(enable ? Color.orange: Color(UIColor.lightGray))
             }
             .disabled(!enable)
         }.padding()
     }
 }

 */

#Preview {
    NavigationStack {
        ContentView_054()
    }
}
