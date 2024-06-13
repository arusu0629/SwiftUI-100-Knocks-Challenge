//
//  ContentView_062.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/06/12.
//

import SwiftUI
import MapKit

/// Map を表示する
struct ContentView_062: ViewWithTitle {
    let title: String = "062: Map を表示する"
    let region = MKCoordinateRegion(center: .init(latitude: 35.7005, longitude: 139.7726), latitudinalMeters: 300, longitudinalMeters: 300)

    var body: some View {
        VStack {
            Map(initialPosition: .region(region))
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

/*
 解答例
 struct ContentView: View {
     var body: some View {
         Map(
             initialPosition:
                 MapCameraPosition.region(
                     MKCoordinateRegion(
                         center: CLLocationCoordinate2D(latitude: 35.7005, longitude: 139.7726),
                         latitudinalMeters: 300,
                         longitudinalMeters: 300
                     )
                 )
         )
     }
 }
*/

#Preview {
    NavigationStack {
        ContentView_062()
    }
}
