//
//  SwiftUI_100_Knocks_ChallengeApp.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/05/01.
//

import SwiftUI

@main
struct SwiftUI_100_Knocks_ChallengeApp: App {
    @AppStorage("isSortedAscending") private var isSortedAscending = true
    @State private var viewData = ContentViewData.testViewData
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                List(viewData, id: \.title) { data in
                    NavigationLink(destination: data.view) {
                        Text("\(data.title)")
                    }
                }
                .navigationTitle("SwiftUI100本ノック!!!")
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        HStack(spacing: 0) {
                            Text("Archived! \(viewData.count)")
                                .foregroundColor(.primary)
                                .font(Font.system(size: 12))
                            SortButton(isSortedAscending: $isSortedAscending) {
                                sortViewData()
                            }
                        }
                    }
                }
                .onAppear(perform: sortViewData)
            }
        }
    }

    private func sortViewData() {
        viewData.sort { isSortedAscending ? $0.title < $1.title : $0.title > $1.title }
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
        ContentViewData(ContentView_008()),
        ContentViewData(ContentView_009()),
        ContentViewData(ContentView_010()),
        ContentViewData(ContentView_011()),
        ContentViewData(ContentView_012()),
        ContentViewData(ContentView_013()),
        ContentViewData(ContentView_014()),
        ContentViewData(ContentView_015()),
        ContentViewData(ContentView_016()),
        ContentViewData(ContentView_017()),
        ContentViewData(ContentView_018()),
        ContentViewData(ContentView_019()),
        ContentViewData(ContentView_020()),
        ContentViewData(ContentView_021()),
        ContentViewData(ContentView_022()),
        ContentViewData(ContentView_023()),
        ContentViewData(ContentView_024()),
        ContentViewData(ContentView_025()),
        ContentViewData(ContentView_026()),
        ContentViewData(ContentView_027()),
        ContentViewData(ContentView_028()),
        ContentViewData(ContentView_029()),
        ContentViewData(ContentView_030()),
        ContentViewData(ContentView_031()),
        ContentViewData(ContentView_032()),
        ContentViewData(ContentView_033()),
        ContentViewData(ContentView_034()),
        ContentViewData(ContentView_035()),
        ContentViewData(ContentView_036()),
        ContentViewData(ContentView_037()),
        ContentViewData(ContentView_038()),
        ContentViewData(ContentView_039()),
        ContentViewData(ContentView_040()),
        ContentViewData(ContentView_041()),
        ContentViewData(ContentView_042()),
        ContentViewData(ContentView_043()),
        ContentViewData(ContentView_044()),
        ContentViewData(ContentView_045()),
        ContentViewData(ContentView_046()),
        ContentViewData(ContentView_048()),
        ContentViewData(ContentView_049()),
        ContentViewData(ContentView_050()),
        ContentViewData(ContentView_051()),
        ContentViewData(ContentView_052()),
        ContentViewData(ContentView_053()),
        ContentViewData(ContentView_054()),
        ContentViewData(ContentView_055()),
        ContentViewData(ContentView_056()),
        ContentViewData(ContentView_057()),
        ContentViewData(ContentView_058()),
        ContentViewData(ContentView_059()),
        ContentViewData(ContentView_060()),
        ContentViewData(ContentView_062()),
        ContentViewData(ContentView_063()),
        ContentViewData(ContentView_065()),
        ContentViewData(ContentView_078()),
        ContentViewData(ContentView_079()),
        ContentViewData(ContentView_080()),
        ContentViewData(ContentView_081()),
        ContentViewData(ContentView_090()),
        ContentViewData(ContentView_091()),
        ContentViewData(ContentView_092()),
        ContentViewData(ContentView_093()),
    ]
}
