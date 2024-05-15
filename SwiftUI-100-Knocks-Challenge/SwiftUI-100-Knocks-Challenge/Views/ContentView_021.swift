//
//  ContentView_021.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/05/15.
//

import SwiftUI

/// FunctionBuilderを使ってViewに影をつける
struct ContentView_021: ViewWithTitle {
    let title: String = "021: FunctionBuilderを使ってViewに影をつける"

    struct ShadowedView<Content: View>: View {
        let content: Content

        init(@ViewBuilder content: () -> Content) {
            self.content = content()
        }

        var body: some View {
            content
                .shadow(color: .black.opacity(0.3), radius: 10, x: 5, y: 5)
        }
    }

    var body: some View {
            ShadowedView {
                VStack(spacing: 10) {
                    Text("Cat")
                        .padding()
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Image("cat001")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 200)
                }
            }

        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

/*
 解答例
 struct ContentView: View {
     var body: some View {
         VStack {
             Text("Snorlax")
                 .card()

             Image(.icon)
                 .resizable()
                 .frame(width: 60, height: 60)
                 .card()

             Text("RedShadow")
                 .card(color: Color.red.opacity(0.4))

             Text("BigShadow")
                 .card(
                     color: Color.green.opacity(0.4),
                     radius: 24)
         }
     }
 }

 struct CardViewModifier: ViewModifier {
     let color: Color
     let radius: CGFloat
     func body(content: Content) -> some View {
         content
             .padding(16)
             .background(Color.white)
             .cornerRadius(16)
             .shadow(color: color, radius: radius, x: 4, y: 4)
             .padding(radius + 8)
     }
 }

 extension View {
     func card(
         color: Color = Color.gray.opacity(0.4),
         radius: CGFloat = 8) -> some View {
             self.modifier(CardViewModifier(color: color, radius: radius))
         }
 }
 */

#Preview {
    NavigationStack {
        ContentView_021()
    }
}
