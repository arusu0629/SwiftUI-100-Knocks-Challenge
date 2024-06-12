//
//  ContentView_059.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/06/12.
//

import SwiftUI

/// List の中にボタンを複数設置する
struct ContentView_059: ViewWithTitle {
    let title: String = "059: List の中にボタンを複数設置する"
    @State private var pokemons = ["Snorlax", "Pikachu", "Slowpoke"]

    var body: some View {
        List() {
            ForEach(pokemons, id: \.self) { pokemon in
                HStack(spacing: 15) {
                    Text("\(pokemon)")
                    Spacer()
                    ContentView_059_CustomButton(buttonText: "Left") {
                        print("on tapped \(pokemon) left")
                    }
                    ContentView_059_CustomButton(buttonText: "Right") {
                        print("on tapped \(pokemon) right")
                    }
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    print("on tapped on cell: \(pokemon)")
                }
            }
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }

    struct ContentView_059_CustomButton: View {

        let buttonText: String
        let action: (() -> Void)

        var body: some View {
            Button(buttonText) {
                action()
            }
            .frame(width: 60, height: 60)
            .overlay(Rectangle().stroke(.green, lineWidth: 2))
            .foregroundStyle(.black)
            /*
             List 内に複数ボタンのタップ操作が機能するように buttonStyle を .automatic 以外に設定する
             https://stackoverflow.com/questions/56561064/swiftui-multiple-buttons-in-a-list-row
             */
            .buttonStyle(.plain)
        }
    }
}

/*
 解答例
 無し
*/

#Preview {
    NavigationStack {
        ContentView_059()
    }
}
