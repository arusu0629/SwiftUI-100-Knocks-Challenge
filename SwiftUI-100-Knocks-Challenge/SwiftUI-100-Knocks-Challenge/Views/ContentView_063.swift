//
//  ContentView_063.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/08/22.
//

import MapKit
import SwiftUI

/// Map を表示し、自分の位置を中心にする
struct ContentView_063: ViewWithTitle {
    let title: String = "063: Map を表示し、自分の位置を中心にする"
    @StateObject private var locationManager = LocationManager()

    var body: some View {
        VStack {
            if let location = locationManager.location {
                Map(
                    initialPosition: .region(
                        .init(
                            center: location,
                            latitudinalMeters: 300,
                            longitudinalMeters: 300
                        )
                    )
                )
            } else {
                Text("Locating...")
            }
        }
        .onAppear {
            locationManager.requestLocation()
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

/*
 解答例
 struct ContentView: View {
     @StateObject var viewState: ContentViewState = ContentViewState()

     var body: some View {
         ZStack {
             if let location = viewState.location {
                 Map(
                     initialPosition:
                         MapCameraPosition.region(
                             MKCoordinateRegion(
                                 center: location,
                                 latitudinalMeters: 300,
                                 longitudinalMeters: 300
                             )
                         )
                 )
             } else {
                 Text("Loading...")
             }
         }
         .onAppear {
             viewState.onAppear()
         }
     }
 }

 import Foundation
 import CoreLocation

 class ContentViewState: NSObject, ObservableObject {
     @Published var location: CLLocationCoordinate2D?
     private let locationManager = CLLocationManager()

     func onAppear() {
         locationManager.delegate = self
         locationManager.requestWhenInUseAuthorization()
         let status = locationManager.authorizationStatus
         switch status {
         case .authorizedWhenInUse:
             locationManager.startUpdatingLocation()
         default:
             break
         }
     }
 }

 extension ContentViewState: CLLocationManagerDelegate {
     func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
         switch status {
         case .authorizedWhenInUse:
             locationManager.startUpdatingLocation()
         default:
             break
         }
     }

     func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
         self.location = manager.location?.coordinate
     }
 }
*/

#Preview {
    NavigationStack {
        ContentView_063()
    }
}
