//
//  ContentView_063.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/06/13.
//

import CoreLocation
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
                ) {
                    MapCircle(center: location, radius: CLLocationDistance(10))
                        .foregroundStyle(.red.opacity(0.6))
                        .mapOverlayLevel(level: .aboveRoads)
                }
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

    final class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
        private let locationManager = CLLocationManager()
        @Published var location: CLLocationCoordinate2D?

        override init() {
            super.init()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
        }

        func requestLocation() {
            locationManager.requestLocation()
        }

        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let location = locations.first else { return }
            self.location = location.coordinate
        }

        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            print("Failed to find user's location: \(error.localizedDescription)")
        }
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
                 ) {
                     MapCircle(center: location, radius: CLLocationDistance(10))
                         .foregroundStyle(Color.red.opacity(0.6))
                         .mapOverlayLevel(level: .aboveRoads)
                 }
             } else {
                 Text("Loading...")
             }
         }
         .onAppear {
             viewState.onAppear()
         }
     }
 }

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
