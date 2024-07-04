//
//  ContentView_091.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/07/04.
//

import PDFKit
import SwiftUI

/// 画像をピンチイン/アウトで縮小/拡大する(PDFView)
struct ContentView_091: ViewWithTitle {
    let title: String = "091: 画像をピンチイン/アウトで縮小/拡大する(PDFView)"

    var body: some View {
        ContentView_091_PDFViewWrapper(image: UIImage(named: "cat001")!)
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
    }

    struct ContentView_091_PDFViewWrapper: UIViewRepresentable {
        let image: UIImage

        func makeUIView(context: Context) -> some UIView {
            let pdfView = PDFView()
            pdfView.autoScales = true
            pdfView.document = PDFDocument()
            guard let page = PDFPage(image: image) else {
                return pdfView
            }
            pdfView.document?.insert(page, at: 0)
            return pdfView
        }

        // NOP
        func updateUIView(_ uiView: UIViewType, context: Context) {}
    }
}

/*
 解答例
 struct ContentView: View {
     var body: some View {
         ImageViewerView(image: UIImage(named: "icon")!)
     }
 }
 struct ImageViewerView: UIViewRepresentable {
     let image: UIImage
     func makeUIView(context: Context) -> PDFView {
         let view = PDFView()
         view.document = PDFDocument()
         guard let page = PDFPage(image: image) else { return view }
         view.document?.insert(page, at: 0)
         view.autoScales = true
         return view
     }

     func updateUIView(_ uiView: PDFView, context: Context) {}
 }
*/

#Preview {
    NavigationStack {
        ContentView_091()
    }
}
