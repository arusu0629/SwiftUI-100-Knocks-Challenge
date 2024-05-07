//
//  SwiftUI_100_Knocks_ChallengeApp.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/05/01.
//

import SwiftUI

@main
struct SwiftUI_100_Knocks_ChallengeApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                List(ContentViewData.testViewData, id: \.title) { data in
                    NavigationLink(destination: data.view) {
                        Text("\(data.title)")
                    }
                }
                .navigationTitle("SwiftUI100本ノック!!!")
            }
        }
    }
}

struct ContentViewData {
    let title: String
    let view: AnyView

    init<V: ViewWithTitle>(_ view: V) {
        self.title = view.title
        self.view = AnyView(view)
    }
}

/// FIXME: フォルダから動的に取得したい
/// とりあえず手動で追加
extension ContentViewData {
    static let testViewData: [ContentViewData] = [
        ContentViewData(ContentView_001()),
        ContentViewData(ContentView_002()),
        ContentViewData(ContentView_003()),
        ContentViewData(ContentView_004()),
        ContentViewData(ContentView_005()),
        ContentViewData(ContentView_006()),
        ContentViewData(ContentView_007()),
    ]
}
