//
//  LocationViewModel.swift
//  GPSViewer
//
//  Created by Douglas Bercot on 4/29/25.
//  Copyright © 2025 NunjoBiznezz. All rights reserved.
//
import Foundation
import CoreLocation
import Combine

class LocationViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()

    @Published var latitude: Double = 0.0
    @Published var longitude: Double = 0.0
    @Published var accuracy: Double = 0.0
    @Published var error: String?

    @Published var format: CoordinateFormat = .decimalDegrees

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager.distanceFilter = kCLDistanceFilterNone // 5 // update when user moves 5+ meters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }

        DispatchQueue.main.async {
            self.latitude = location.coordinate.latitude
            self.longitude = location.coordinate.longitude
            self.accuracy = location.horizontalAccuracy
            self.error = nil
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        if let clError = error as? CLError, clError.code == .locationUnknown {
                // Just wait for the next location update
                return
            }

        DispatchQueue.main.async {
            self.error = error.localizedDescription
        }
    }

    var formattedLatitude: String {
        CoordinateFormatter.format(latitude, format: format)
    }

    var formattedLongitude: String {
        CoordinateFormatter.format(longitude, format: format)
    }
}

