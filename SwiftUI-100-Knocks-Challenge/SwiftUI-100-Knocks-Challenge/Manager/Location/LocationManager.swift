//
//  LocationManager.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/06/14.
//

import Foundation
import CoreLocation

final class LocationManager: NSObject, ObservableObject {
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
}

extension LocationManager: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        self.location = location.coordinate
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }
}
