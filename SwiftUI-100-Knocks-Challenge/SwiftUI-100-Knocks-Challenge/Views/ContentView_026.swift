//
//  ContentView_026.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/05/17.
//

import SwiftUI

/// ListView からそれぞれ別の View に遷移する
struct ContentView_026: ViewWithTitle {
    let title: String = "026: ListView からそれぞれ別の View に遷移する"

    var body: some View {
        List {
            ForEach(0..<5) { index in
                NavigationLink("Row \(index)") {
                    if index.isMultiple(of: 2) {
                        ContentView_026_evenView()
                    } else {
                        ContentView_026_oddView()
                    }
                }
            }
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }

    struct ContentView_026_oddView: View {
        var body: some View {
            Text("Welcome to odd view")
        }
    }

    struct ContentView_026_evenView: View {
        var body: some View {
            Text("Welcome to even view")
        }
    }

}

#Preview {
    NavigationStack {
        ContentView_026()
    }
}
