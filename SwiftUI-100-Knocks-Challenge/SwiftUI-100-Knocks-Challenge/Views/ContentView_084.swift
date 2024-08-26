//
//  ContentView_084.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/08/26.
//

import SwiftUI

/// List に Button を設定して画面に違う画面に遷移する
struct ContentView_084: ViewWithTitle {
    let title: String = "084: List に Button を設定して画面に違う画面に遷移する"
    @State private var items = ["cat001", "cat002", "cat003"]


    var body: some View {
        VStack {
            List {
                ForEach(items, id: \.self) { item in
                    NavigationLink(destination: ContentView_084_SecondView(imageName: item)) {
                        Text(item)
                    }
                }
            }
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }

    struct ContentView_084_SecondView: View {

        let imageName: String

        var body: some View {
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                Text(imageName)
            }
        }
    }
}

/*
 解答例
 struct ContentView: View {
     @State var pokemon: Pokemon?

     var body: some View {
         NavigationStack {
             List {
                 Button {
                     pokemon = .snorlax
                 } label: {
                     Text("Snorlax")
                 }
                 Button {
                     pokemon = .slowpoke
                 } label: {
                     Text("Slowpoke")
                 }
                 Button {
                     pokemon = .eevee
                 } label: {
                     Text("Eevee")
                 }
             }
             .navigationDestination(item: $pokemon) { pokemon in
                 switch pokemon {
                 case .snorlax:
                     VStack {
                         Image(.snorlax)
                         Text("Snorlax")
                     }
                 case .slowpoke:
                     Text("Slowpoke")
                 case .eevee:
                     Image(.eevee)
                 }
             }
         }
     }
 }

 enum Pokemon: Hashable {
     case snorlax
     case slowpoke
     case eevee
 }
*/

#Preview {
    NavigationStack {
        ContentView_084()
    }
}
