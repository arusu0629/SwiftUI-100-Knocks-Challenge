//
//  ContentView_031.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/05/21.
//

import SwiftUI

/// Preview を横向きにする
struct ContentView_031: ViewWithTitle {
    let title: String = "031: Preview を横向きにする"

    var body: some View {
        Text("I Love Snorlax Forever!!!")
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
    }
}

/*
 解答例
 struct ContentView: View {
     var body: some View {
         Text("I Love Snorlax Forever!!")
     }
 }

 struct ContentView_Previews: PreviewProvider {
     static var previews: some View {
         ContentView()
             .previewInterfaceOrientation(.landscapeLeft)
     }
 }
 */

#Preview {
    NavigationStack {
        ContentView_031()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
