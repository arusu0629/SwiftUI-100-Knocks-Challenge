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
                List(ViewData.testViewData, id: \.title) { data in
                    NavigationLink(destination: data.view) {
                        Text("\(data.title)")
                    }
                }
                .navigationTitle("SwiftUI100本ノック!!!")
            }
        }
    }
}

struct ViewData {
    let title: String
    let view: AnyView

    init(view: some View) {
        if let viewWithTitle = view as? ViewWithTitle {
            self.title = viewWithTitle.title
            self.view = AnyView(view)
        } else {
            self.title = "Unknown View Title"
            self.view = AnyView(view)

        }
    }
}

/// FIXME: フォルダから動的に取得したい
/// とりあえず手動で追加
extension ViewData {
    static let testViewData: [ViewData] = [
        ViewData(view: ContentView_001()),
        ViewData(view: ContentView_002()),
        ViewData(view: ContentView_003()),
    ]
}
