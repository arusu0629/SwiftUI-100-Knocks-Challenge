//
//  ContentView_015.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/05/08.
//

import SwiftUI

/// Alertを出し分ける
struct ContentView_015: ViewWithTitle {
    let title: String = "015: Alertを出し分ける"
    @State private var isPresentedAlert1 = false
    @State private var isPresentedAlert2 = false
    var body: some View {
        VStack {
            Button("Pikachu") {
                isPresentedAlert1 = true
            }
            .alert(isPresented: $isPresentedAlert1) {
                Alert(
                    title: Text("Title Pikachu"),
                    message: Text("Message Pikachu")
                )
            }
            Button("Snorlax") {
                isPresentedAlert2 = true
            }
            .alert(isPresented: $isPresentedAlert2) {
                Alert(
                    title: Text("Title Snorlax"),
                    message: Text("Message Snorlax")
                )
            }
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

/*
 解答例
 struct ContentView: View {
     @State var showingAlert = false
     @State var alertItem: AlertItem? /* MEMO: AlertItem が存在せずにエラーになる */

     var body: some View {
         VStack {
             Button {
                 alertItem = AlertItem(buttonTitle: "Pikachu", message: "Pikachu is a fictional species in the Pokémon media franchise. ")
                 showingAlert = true
             } label: {
                 Text("Pikachu")
             }

             Button {
                 alertItem = AlertItem(buttonTitle: "Snorlax", message: "Snorlax is most popular Pokémon.")
                 showingAlert = true
             } label: {
                 Text("Snorlax")
             }
         }
         .alert("Alert Title", isPresented: $showingAlert, presenting: alertItem) { alertItem in
             Button(alertItem.buttonTitle, role: .none) {
                 print(alertItem.buttonTitle)
             }
         } message: { alertItem in
             Text(alertItem.message)
         }
     }
 }
 */

#Preview {
    NavigationView {
        ContentView_015()
    }
}
