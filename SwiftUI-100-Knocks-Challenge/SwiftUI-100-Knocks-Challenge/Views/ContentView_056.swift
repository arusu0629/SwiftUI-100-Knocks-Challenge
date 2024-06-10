//
//  ContentView_056.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/06/10.
//

import SwiftUI

/// シートを表示し、プッシュ遷移後にシートを閉じる
struct ContentView_056: ViewWithTitle {
    let title: String = "056: シートを表示し、プッシュ遷移後にシートを閉じる"
    @State private var isShowingSheet = false

    var body: some View {
        Button("ShowSheet") {
            isShowingSheet = true
        }
        .sheet(isPresented: $isShowingSheet) {
            // シート表示先のビューでナビゲーションバーを表示したいため NavigationStack で囲む
            NavigationStack {
                ContentView_056_FirstView(isShowingSheet: $isShowingSheet)
            }
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }

    struct ContentView_056_FirstView: View {
        @Binding var isShowingSheet: Bool
        var body: some View {
            NavigationLink("Go to SecondSheet") {
                ContentView_056_SecondView(isShowingSheet: $isShowingSheet)
            }
            .navigationTitle("FirstSheet")
        }
    }

    struct ContentView_056_SecondView: View {
        @Binding var isShowingSheet: Bool
        var body: some View {
            Button("Close Sheet") {
                isShowingSheet = false
            }
            .navigationTitle("SecondSheet")
        }
    }

}

/*
 解答例
 struct ContentView: View {
     @State var showingSheet : Bool = false

     var body: some View {
         Button(action: {
             showingSheet = true
         }, label: {
             Text("ShowSheet")
         })
         .sheet(isPresented: $showingSheet){
             FirstSheet(showingSheet: $showingSheet)
         }
     }
 }

 struct FirstSheet: View {
     @Binding var showingSheet : Bool

     var body: some View {
         NavigationStack {
             NavigationLink(
                 destination: SecondSheet(showingSheet: $showingSheet),
                 label: {
                     Text("Go to SecondSheet")
                 }
             )
             .navigationTitle("FirstSheet")
         }
     }
 }

 struct SecondSheet: View {
     @Binding var showingSheet : Bool

     var body: some View {
         VStack {
             Button(action: {
                 showingSheet = false
             } ){
                 Text("Close Sheet")
             }
         }
         .navigationBarTitle("SecondSheet")
     }
 }
*/

#Preview {
    NavigationStack {
        ContentView_056()
    }
}
