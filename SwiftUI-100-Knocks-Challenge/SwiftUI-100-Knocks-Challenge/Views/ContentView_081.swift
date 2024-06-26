//
//  ContentView_081.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/06/26.
//

import SwiftUI

/// UIActivityViewController を表示する
struct ContentView_081: ViewWithTitle {
    let title: String = "081: UIActivityViewController を表示する"
    @State private var isShareSheetPresented = false
    @State private var textToShare = "This is a sample text to share"

    var body: some View {
        VStack {
            Text("Share this text:")
                .font(.headline)
            Text(textToShare)
                .padding()

            Button("Share") {
                isShareSheetPresented = true
            }
            .sheet(isPresented: $isShareSheetPresented) {
                ContentView_081_ActivityViewController(activityItems: [textToShare])
            }
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }

    struct ContentView_081_ActivityViewController: UIViewControllerRepresentable {
        var activityItems: [Any]
        var applicationActivities: [UIActivity]? = nil

        func makeUIViewController(context: Context) -> some UIViewController {
            let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
            return controller
        }

        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            // No need to update the view controller as it doesn't change once presented
        }
    }
}

/*
 解答例
 struct ContentView: View {
     @State private var showingActivityIndicator: Bool = false
     var body: some View {
         Button("Share swiswiswift.com") {
             showingActivityIndicator = true
         }
         .sheet(isPresented: $showingActivityIndicator) {
             ActivityViewController(activityItems: [URL(string: "https://swiswiswift.com")!])
         }
     }
 }

 struct ActivityViewController: UIViewControllerRepresentable {
     var activityItems: [Any]
     var applicationActivities: [UIActivity]? = nil

     func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityViewController>) -> UIActivityViewController {
         let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
         return controller
     }

     func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ActivityViewController>) {}
 }
*/

#Preview {
    NavigationStack {
        ContentView_081()
    }
}
