//
//  ContentView_050.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/06/04.
//

import SwiftUI

/// 入力した文字列をモーダル遷移した画面に値を渡す
struct ContentView_050: ViewWithTitle {
    let title: String = "050: 入力した文字列をモーダル遷移した画面に値を渡す"
    @State private var text = ""
    @State private var isShowingSheet = false

    var body: some View {
        VStack(spacing: 20) {
            TextField("InputName", text: $text)
                .textFieldStyle(.roundedBorder)
                .padding()
            Text("Name: \(text)")
            Button("Show Modal") {
                isShowingSheet = true
            }
            .frame(width: 140, height: 60)
            .background(.gray)
            .foregroundStyle(.white)
            .fontWeight(.bold)
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
        .sheet(isPresented: $isShowingSheet) {
            Text("Name: \(text)")
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

/*
 解答例
 struct ContentView: View {
     @State var name = ""
     @State var showingSheet = false

     var body: some View {
         VStack(spacing: 16) {
             TextField("Input Name", text: $name)
                 .textFieldStyle(RoundedBorderTextFieldStyle())
                 .padding()
             Text("Name: \(name)")

             Button {
                 showingSheet = true
             } label: {
                 Text("Show Modal")
                     .font(Font.system(size: 20))
                     .foregroundColor(Color.white)
                     .padding(16)
                     .background(Color.gray)
                     .cornerRadius(16)
             }
             .sheet(isPresented: $showingSheet) {
                 PokemonView(pokemonName: name)
             }
         }
     }
 }

 struct PokemonView: View {
     let pokemonName: String
     var body: some View {
         Text("Name: \(pokemonName)")
     }
 }
 */

#Preview {
    NavigationStack {
        ContentView_050()
    }
}
