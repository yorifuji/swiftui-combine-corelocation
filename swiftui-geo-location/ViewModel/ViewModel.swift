//
//  ViewModel.swift
//  swiftui-geo-location
//
//  Created by yorifuji on 2021/05/20.
//

import Foundation
import CoreLocation

final class ViewModel: NSObject, ObservableObject {
    let model: LocationModel
    @Published var lastLocation: CLLocation?

    init(model: LocationModel) {
        self.model = model
    }

    func request() {
        model.request()
    }

    func start() {
        model.start(delegate: self)
    }

    func stop() {
        model.stop()
    }

    var lat: CLLocationDegrees {
        if let location = lastLocation {
            return location.coordinate.latitude
        } else {
            return 0
        }
    }

    var lon: CLLocationDegrees {
        if let location = lastLocation {
            return location.coordinate.longitude
        } else {
            return 0
        }
    }
}

extension ViewModel: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        print(manager.authorizationStatus)
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])")
        print(locations)
        print(manager.activityType)
        print(manager.activityType == .automotiveNavigation)

        self.lastLocation = locations.last
    }

}
