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
            let scrollView = UIScrollView()
            scrollView.delegate = context.coordinator
            scrollView.minimumZoomScale = 1.0
            scrollView.maximumZoomScale = 6.0

            let imageView = UIImageView(image: image)
            imageView.contentMode = .scaleAspectFit
            imageView.frame = .init(origin: .zero, size: image.size)

            scrollView.addSubview(imageView)
            scrollView.contentSize = image.size

            context.coordinator.imageView = imageView
            context.coordinator.scrollView = scrollView

            DispatchQueue.main.async {
                context.coordinator.updateZoomScale()
                context.coordinator.centerImage()
            }

            return scrollView
        }

        // NOP
        func updateUIView(_ uiView: UIViewType, context: Context) {}

        func makeCoordinator() -> Coordinator {
            Coordinator(self)
        }

        class Coordinator: NSObject, UIScrollViewDelegate {
            var parent: ContentView_092_ImageViewWrapper
            var imageView: UIImageView?
            var scrollView: UIScrollView?

            init(_ parent: ContentView_092_ImageViewWrapper) {
                self.parent = parent
            }

            func viewForZooming(in scrollView: UIScrollView) -> UIView? {
                return imageView
            }

            func updateZoomScale() {
                guard let scrollView = scrollView, 
                        let imageView = imageView else {
                    return
                }

                let widthScale = scrollView.bounds.width / imageView.bounds.width
                let heightScale = scrollView.bounds.height / imageView.bounds.height
                let minScale = min(widthScale, heightScale)

                scrollView.minimumZoomScale = minScale
                scrollView.zoomScale = minScale
            }

            func centerImage() {
                guard let scrollView = scrollView,
                      let imageView = imageView else {
                    return
                }
                let scrollViewSize = scrollView.bounds.size
                let imageSize = imageView.frame.size
                let horizontalPadding = max(0, (scrollViewSize.width - imageSize.width) / 2)
                let verticalPadding = max(0, (scrollViewSize.height - imageSize.height) / 2)

                scrollView.contentInset = UIEdgeInsets(top: verticalPadding, left: horizontalPadding, bottom: verticalPadding, right: horizontalPadding)
            }
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
