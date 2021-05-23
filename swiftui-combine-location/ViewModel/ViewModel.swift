//
//  ViewModel.swift
//  swiftui-combine-location
//
//  Created by yorifuji on 2021/05/20.
//

import CoreLocation
import Combine

final class ViewModel: NSObject, ObservableObject {
    let model: LocationDataSource
    @Published var authorizationStatus = CLAuthorizationStatus.notDetermined
    @Published var location: CLLocation = .init()

    var latitude: CLLocationDegrees {
        location.coordinate.latitude
    }

    var longitude: CLLocationDegrees {
        location.coordinate.longitude
    }

    init(model: LocationDataSource) {
        self.model = model
    }

    func requestAuthorization() {
        model.requestAuthorization()
    }

    func activate() {
        model.authorizationPublisher()
            .print("dump:status")
            .assign(to: &$authorizationStatus)

        model.locationPublisher()
            .print("dump:location")
            .compactMap { $0.last }
            .assign(to: &$location)
    }

    func deactivate() {
    }

    func startTracking() {
        model.startTracking()
    }

    func stopTracking() {
        model.stopTracking()
    }
}
