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
    @State private var alertType: AlertType?
    var body: some View {
        VStack {
            Button("Pikachu") {
                alertType = .pikachu
            }
            Button("Snorlax") {
                alertType = .snorlax
            }
            .alert(alertType?.title ?? "", isPresented: Binding<Bool>(
                get: { alertType != nil },
                set: { _ in alertType = nil }
            )) {
                Button("OK") {
                    print("pressed ok")
                }
            } message: {
                Text(alertType?.message ?? "")
            }
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

extension ContentView_015 {
    enum AlertType {
        case pikachu, snorlax

        var title: String {
            switch self {
            case .pikachu:
                return "Title: Pikachu"
            case .snorlax:
                return "Title: Snorlax"
            }

        }

        var message: String {
            switch self {
            case .pikachu:
                return "Message: Pikachu"
            case .snorlax:
                return "Message: Snorlax"
            }
        }
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
