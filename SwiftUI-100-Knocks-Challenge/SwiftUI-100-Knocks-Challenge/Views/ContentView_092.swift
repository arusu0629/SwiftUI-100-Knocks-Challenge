//
//  ContentView_092.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/07/05.
//

import SwiftUI

/// 画像をピンチイン/アウトで縮小/拡大する(UIImageView + UIScrollView)
struct ContentView_092: ViewWithTitle {
    let title: String = "092: 画像をピンチイン/アウトで縮小/拡大する(UIImageView + UIScrollView)"

    var body: some View {
        ContentView_092_ImageViewWrapper(image: UIImage(named: "cat001")!)
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
    }

    struct ContentView_092_ImageViewWrapper: UIViewRepresentable {
        let image: UIImage

        func makeUIView(context: Context) -> some UIView {
            let view = ContentView_092_UIImageView(image: image)
            return view
        }

        func updateUIView(_ uiView: UIViewType, context: Context) {}
    }

    public class ContentView_092_UIImageView: UIView, UIScrollViewDelegate {
        private let image: UIImage
        private let scrollView = UIScrollView()
        private let imageView = UIImageView()

        required init(image: UIImage) {
            self.image = image
            super.init(frame: .zero)

            scrollView.delegate = self
            scrollView.minimumZoomScale = 1.0
            scrollView.maximumZoomScale = 6.0

            addSubview(scrollView)

            imageView.image = image
            imageView.contentMode = .scaleAspectFit
            scrollView.addSubview(imageView)
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        public override func layoutSubviews() {
            super.layoutSubviews()
            scrollView.frame = bounds
            imageView.frame = scrollView.frame
        }

        public func viewForZooming(in scrollView: UIScrollView) -> UIView? {
            return imageView
        }
    }
}

/*
 解答例
 struct ContentView: View {
     var body: some View {
         ImageViewerView(imageName: "icon")
             .ignoresSafeArea(.all, edges: .all)
     }
 }

 struct ImageViewerView: UIViewRepresentable {
     let imageName: String
     func makeUIView(context: Context) -> UIImageViewerView {
         let view = UIImageViewerView(imageName: imageName)
         return view
     }

     func updateUIView(_ uiView: UIImageViewerView, context: Context) {}
 }

 public class UIImageViewerView: UIView {
     private let imageName: String
     private let scrollView: UIScrollView = UIScrollView()
     private let imageView: UIImageView = UIImageView()

     required init(imageName: String) {
         self.imageName = imageName
         super.init(frame: .zero)

         scrollView.delegate = self
         scrollView.maximumZoomScale = 3.0
         scrollView.minimumZoomScale = 1.0
         // if you want to disable indicater
         // scrollView.showsHorizontalScrollIndicator = false
         // scrollView.showsVerticalScrollIndicator = false
         addSubview(scrollView)

         imageView.image = UIImage(named: imageName)
         imageView.contentMode = .scaleAspectFit
         scrollView.addSubview(imageView)
     }

     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }

     public override func layoutSubviews() {
        super.layoutSubviews()
         scrollView.frame = bounds
         imageView.frame = scrollView.frame
     }
 }

 extension UIImageViewerView: UIScrollViewDelegate {
     public func viewForZooming(in scrollView: UIScrollView) -> UIView? {
         return imageView
     }
 }
*/

#Preview {
    NavigationStack {
        ContentView_092()
    }
}
