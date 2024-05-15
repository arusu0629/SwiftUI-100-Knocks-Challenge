//
//  ContentView_023.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/05/15.
//

import SwiftUI

/// リストを編集する
struct ContentView_023: ViewWithTitle {
    let title: String = "023: リストを編集する"
    @State private var names = ["Paul", "Taylor", "Adele"]

    var body: some View {
        List {
            ForEach(names, id: \.self) { name in
                Text(name)
            }
            .onDelete(perform: delete)
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            EditButton()
        }
    }

    func delete(at offsets: IndexSet) {
        names.remove(atOffsets: offsets)
    }
}

/*
 解答例
 struct ContentView: View {
     @State private var users = ["Paul", "Taylor", "Adele"]

     var body: some View {
         NavigationView {
             List {
                 ForEach(users, id: \.self) { user in
                     Text(user)
                 }
                 .onDelete(perform: delete)
             }
             .navigationBarItems(trailing: EditButton())
         }
     }

     func delete(at offsets: IndexSet) {
         users.remove(atOffsets: offsets)
     }
 }
 */

#Preview {
    NavigationStack {
        ContentView_023()
    }
}
