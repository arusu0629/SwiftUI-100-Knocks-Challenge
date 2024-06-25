//
//  ContentView_080.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/06/19.
//

import SwiftUI
import UniformTypeIdentifiers

/// iOS のファイルアプリ(UIDocumentPickerViewController) を開いてドキュメントフォルダに保存したファイルを開く
struct ContentView_080: ViewWithTitle {
    let title: String = "080: iOS のファイルアプリ(UIDocumentPickerViewController) を開いてドキュメントフォルダに保存したファイルを開く"
    @State private var selectedURL: URL?
    @State private var isDocumentPickerViewPresented = false
    @State private var isSaveTextFilePresented = false
    @State private var textToSave = "This is a sample text."

    var body: some View {
        VStack {
            Button("Save File to Document") {
                let documentDirectoryUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
                let fileUrl = documentDirectoryUrl.appendingPathComponent("sample.txt")
                do {
                    try textToSave.data(using: .utf8)!.write(to: fileUrl, options: .atomic)
                    print("$$$ File saved successfully path: \(fileUrl)")
                } catch {
                    print("$$$ Failed to save file: \(error.localizedDescription)")
                }
            }

            Button("Show File Picker") {
                isDocumentPickerViewPresented = true
            }
        }
        .sheet(isPresented: $isDocumentPickerViewPresented) {
            ContentView_080_DocumentPickerView(selectedURL: $selectedURL)
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }

    struct ContentView_080_DocumentPickerView: UIViewControllerRepresentable {

        @Binding var selectedURL: URL?

        final class Coordinator: NSObject, UIDocumentPickerDelegate {
            var parent: ContentView_080_DocumentPickerView

            init(_ parent: ContentView_080_DocumentPickerView) {
                self.parent = parent
            }

            func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
                guard let url = urls.first else {
                    return
                }
                parent.selectedURL = url
            }
        }

        func makeUIViewController(context: Context) -> some UIViewController {
            let documentPickerViewController = UIDocumentPickerViewController(forOpeningContentTypes: [.plainText])
            documentPickerViewController.delegate = context.coordinator
            return documentPickerViewController
        }

        // NOP
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}

        func makeCoordinator() -> Coordinator {
            Coordinator(self)
        }
    }
}

/*
 解答例
 struct ContentView: View {
     @State private var fileUrl: URL?
     @State private var showingPicker = false

     var body: some View {
         VStack {
             Button {
                 let documentDirectoryUrl = FileManager.default.urls( for: .documentDirectory, in: .userDomainMask ).first!
                 let fileUrl = documentDirectoryUrl.appendingPathComponent("snorlax.txt")
                 try! "I Love Snorlax!".data(using: .utf8)!.write(to: fileUrl, options: .atomic)
             } label: {
                 Text("Save File to Document")
             }

             Button {
                 showingPicker = true
             } label: {
                 Text("Show File Picker")
             }

             Text("FileUrl: \(fileUrl?.description ?? "nil")")
         }
         .sheet(isPresented: $showingPicker) {
             DocumentPickerView(fileUrl: $fileUrl)
         }
     }
 }

 struct DocumentPickerView : UIViewControllerRepresentable {
     @Binding var fileUrl: URL?

     class Coordinator: NSObject, UIDocumentPickerDelegate {
         var parent: DocumentPickerView

         init(_ parent: DocumentPickerView) {
             self.parent = parent
         }

         func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt url: URL) {
             self.parent.fileUrl = url
         }
     }

     func makeUIViewController(context: Context) -> UIDocumentPickerViewController {
         let documentPickerViewController =  UIDocumentPickerViewController(forOpeningContentTypes: [UTType.text])
         documentPickerViewController.delegate = context.coordinator
         return documentPickerViewController
     }

     func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: Context) {}

     func makeCoordinator() -> Coordinator {
         Coordinator(self)
     }
 }
*/

#Preview {
    NavigationStack {
        ContentView_080()
    }
}
