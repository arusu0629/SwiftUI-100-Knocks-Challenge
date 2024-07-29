//
//  ContentView_094.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/07/29.
//

import SwiftUI

/// シートを出し分ける
struct ContentView_094: ViewWithTitle {
    let title: String = "094: シートを出し分ける"

    enum SheetState {
        case none
        case cat(imageName: String)

        var isPresented: Bool {
            if case .none = self {
                return false
            }
            return true
        }

        var imageName: String {
            switch self {
            case .none:
                return ""
            case .cat(let imageName):
                return imageName
            }
        }
    }
    @State private var sheetState: ContentView_094.SheetState = .none

    var body: some View {
        VStack {
            Button("Show Cat001") {
                sheetState = .cat(imageName: "cat001")
            }
            Button("Show Cat002") {
                sheetState = .cat(imageName: "cat002")
            }
        }
        .sheet(
            isPresented: Binding<Bool>(
                get: {
                    sheetState.isPresented
                },
                set: { _ in
                    sheetState = .none
                }
            ),
            content: {
                ContentView_094_SheetView(imageName: sheetState.imageName)
            }
        )
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }

    struct ContentView_094_SheetView: View {
        var imageName: String

        var body: some View {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 200)
        }
    }
}

/*
 解答例
 struct ContentView: View {
     @State var showingSnorlaxView = false
     @State var showingSlowpokeView = false

     var body: some View {
         VStack {
             Button(action: {
                 showingSnorlaxView = true
             }) {
                 Text("Show Snorlax")
             }

             Button(action: {
                 showingSlowpokeView = true
             }) {
                 Text("Show Slowpoke")
             }
         }
         .sheet(isPresented: $showingSnorlaxView) {
             SnorlaxView()
         }
         .sheet(isPresented: $showingSlowpokeView) {
             SlowpokeView()
         }
     }
 }

 struct SnorlaxView: View {
     var body: some View {
         Image(.snorlax)
             .resizable()
             .frame(width: 150, height: 150)
             .scaledToFit()
     }
 }

 struct SlowpokeView: View {
     var body: some View {
         Image(.slowpoke)
             .resizable()
             .frame(width: 150, height: 150)
             .scaledToFit()
     }
 }
*/

#Preview {
    NavigationStack {
        ContentView_094()
    }
}
