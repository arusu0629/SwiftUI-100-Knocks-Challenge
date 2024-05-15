//
//  ContentView_022.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/05/15.
//

import SwiftUI

/// ViewModifierを使ってViewに影をつける
struct ContentView_022: ViewWithTitle {
    let title: String = "022: ViewModifierを使ってViewに影をつける"

    struct ShadowModifier: ViewModifier {
        func body(content: Content) -> some View {
            content
                .shadow(color: .black.opacity(0.3), radius: 10, x: 5, y: 5)
        }
    }

    var body: some View {
        VStack(spacing: 10) {
            Text("Cat")
                .padding()
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .modifier(ShadowModifier())
            Image("cat001")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 200)
                .modifier(ShadowModifier())
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
             CardView {
                 Text("Snorlax")
             }

             CardView {
                 Image(.icon)
                     .resizable()
                     .frame(width: 60, height: 60)
             }

             CardView(color: Color.red.opacity(0.4)) {
                 Text("RedShadow")
             }

             CardView(
                 color: Color.green.opacity(0.4),
                 radius: 24) {
                     Text("BigShadow")
             }
         }
     }
 }

 struct CardView<Content>: View where Content: View {
     let color: Color
     let radius: CGFloat
     let content: () -> Content

     init(
         color: Color = Color.gray.opacity(0.4),
         radius: CGFloat = 8,
         @ViewBuilder content: @escaping () -> Content) {
         self.content = content
         self.color = color
         self.radius = radius
     }

     var body: some View {
         content()
         .padding(16)
         .background(Color.white)
         .cornerRadius(16)
         .shadow(color: color, radius: radius, x: 4, y: 4)
         .padding(radius + 8)
     }
 }
 */

#Preview {
    NavigationStack {
        ContentView_022()
    }
}
