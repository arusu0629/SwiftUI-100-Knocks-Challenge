//
//  ContentView_036.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/05/22.
//

import SwiftUI

/// アプリ起動時に画面を遷移させる
struct ContentView_036: ViewWithTitle {
    let title: String = "036: アプリ起動時に画面を遷移させる"
    @State private var isActive = false

    var body: some View {
        VStack {
            if isActive {
                ContentView_036_HomeView()
            } else {
                ContentView_036_LaunchView()
            }
        }
        .task {
            // 2秒待って遷移する
            try? await Task.sleep(nanoseconds: 2 * 1_000_000_000)
            withAnimation {
                isActive = true
            }
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }

    struct ContentView_036_LaunchView: View {
        var body: some View {
            VStack {
                Image("cat001")
                    .resizable()
                    .frame(width: 100, height: 100)
                Text("Launch")
                Text("※2秒後に Home 画面に遷移します")
            }
        }
    }

    struct ContentView_036_HomeView: View {
        var body: some View {
            VStack {
                Image("cat002")
                    .resizable()
                    .frame(width: 100, height: 100)
                Text("Home")
            }
        }
    }
}

/*
 解答例
 struct ContentView: View {
     @State var viewType: ViewType = .launch

     var body: some View {
         ZStack {
             switch viewType {
             case .launch:
                 Text("Launch")
             case .home:
                 Text("Home")
             }
         }
         .onAppear {
             Task {
                 try? await sleep()
                 withAnimation(.linear(duration: 0.5)) {
                     viewType = .home
                 }
             }
         }
     }

     func sleep() async throws {
         // sleep 2sec
         _ = try await Task.sleep(nanoseconds: 2_000_000_000)
     }
 }

 enum ViewType {
     case launch
     case home
 }
 */

#Preview {
    NavigationStack {
        ContentView_036()
    }
}
