//
//  ContentView_033.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/05/21.
//

import SwiftUI

/// UICollectionView のように View を並べる
struct ContentView_033: ViewWithTitle {
    let title: String = "033: UICollectionView のように View を並べる"
    let items = (1...50).map { "Item \($0)"}
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(items, id: \.self) { item in
                    VStack {
                        Text(item)
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .foregroundStyle(.white)
                            .background(.gray)
                    }
                }
            }
            .padding()
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

/*
 解答例
 struct ContentView: View {
     let columns = [GridItem(.fixed(80)), GridItem(.fixed(80)), GridItem(.fixed(80)), GridItem(.fixed(80))]

     var body: some View {
         ScrollView {
             LazyVGrid(columns: columns) {
                 ForEach(0..<100, id: \.self) { number in
                     Text("\(number)")
                         .foregroundStyle(Color.white)
                         .font(.title)
                         .frame(width: 80, height: 80)
                         .background(Color.gray)
                 }
             }
         }
     }
 }
 */

#Preview {
    NavigationStack {
        ContentView_033()
    }
}
