//
//  ContentView_052.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/06/06.
//

import SwiftUI

/// ボタンを押すとポップアップを表示する
struct ContentView_052: ViewWithTitle {
    let title: String = "052: ボタンを押すとポップアップを表示する"
    @State private var isShowingPopup = false

    var body: some View {
        ZStack {
            Color.gray
                .opacity(0.8)

            Button("Tap Me!!") {
                withAnimation {
                    isShowingPopup = true
                }
            }
            .frame(width: 120, height: 60)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))

            if isShowingPopup {
                ContentView_052_PopupView(isShowingPopup: $isShowingPopup)
            }
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }

    struct ContentView_052_PopupView: View {
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
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 25))
        }
    }
}

/*
 解答例
 struct ContentView: View {
     @State var showingPopUp = false
     var body: some View {
         ZStack {
             Button(action: {
                 withAnimation {
                     showingPopUp = true
                 }
             }, label: {
                 Text("Tap Me!!")
                     .padding()
                     .background(Color.white)
                     .cornerRadius(12)
             })

             if showingPopUp {
                 PopupView(isPresent: $showingPopUp)
             }
         }
         .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
         .background(Color.gray)
         .ignoresSafeArea()
     }
 }

 struct PopupView: View {
     @Binding var isPresent: Bool

     var body: some View {
         VStack(spacing: 12) {
             Text("Snorlax")
                 .font(Font.system(size: 18).bold())

             Image("icon")
                 .resizable()
                 .frame(width: 80, height: 80)

             Text("Snorlax (Japanese: カビゴン Kabigon) is a Normal-type Pokemon. Snorlax is most popular Pokemon.")
                 .font(Font.system(size: 18))

             Button(action: {
                 withAnimation {
                     isPresent = false
                 }
             }, label: {
                 Text("Close")
             })
         }
         .frame(width: 280, alignment: .center)
         .padding()
         .background(Color.white)
         .cornerRadius(12)
     }
 }

 */

#Preview {
    NavigationStack {
        ContentView_052()
    }
}
