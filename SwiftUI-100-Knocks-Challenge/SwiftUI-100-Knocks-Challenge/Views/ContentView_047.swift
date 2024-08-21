//
//  ContentView_047.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/08/21.
//

import MapKit
import SwiftUI

/// SwiftUI で Map を使う。Map に画像や図形を表示する
/// 解答例を写経
struct ContentView_047: ViewWithTitle {
    let title: String = "047: SwiftUI で Map を使う。Map に画像や図形を表示する"
    // Tokyo Station(35.6812° N, 139.7671° E)
    let tokyoStation = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.6812, longitude: 139.7671), latitudinalMeters: 10000, longitudinalMeters: 10000)

    var body: some View {
        Map(initialPosition: .region(tokyoStation)) {
            // Akihabara Station(36.6984°N, 139.7731° E)
            MapCircle(center: CLLocationCoordinate2D(latitude: 35.6984, longitude: 139.7731), radius: CLLocationDistance(800))
                .foregroundStyle(.orange.opacity(0.60))
                .mapOverlayLevel(level: .aboveLabels)

            // Cat001 at Akihabara Station(36.6984°N, 139.7731° E)
            Annotation("Cat001", coordinate: CLLocationCoordinate2D(latitude: 35.6984, longitude: 139.7731)) {
                Image("cat001")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .scaledToFit()
            }

            // Polygon
            MapPolygon(coordinates: [
                // Shibuya Station(35.6580° N, 139.7016° E)
               CLLocationCoordinate2D(latitude: 35.6580, longitude: 139.7016),

               // Akihabara Station(35.6984° N, 139.7731° E)
               CLLocationCoordinate2D(latitude: 35.6984, longitude: 139.7731),

               // Tokyo Station(35.6812° N, 139.139.7671° E)
               CLLocationCoordinate2D(latitude: 35.6812, longitude: 139.7671)
            ])
            .foregroundStyle(.blue.opacity(0.60))
            .mapOverlayLevel(level: .aboveLabels)
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ContentView_047()
    }
}
