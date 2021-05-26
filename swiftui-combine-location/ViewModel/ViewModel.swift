//
//  ViewModel.swift
//  swiftui-combine-location
//
//  Created by yorifuji on 2021/05/20.
//

import Combine
import CoreLocation
import SwiftUI

final class ViewModel: NSObject, ObservableObject {
    let model: LocationDataSource
    @State var isActive = false
    @Published var authorizationStatus: CLAuthorizationStatus = .notDetermined
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
        guard !isActive else { return }
        model.authorizationPublisher().assign(to: &$authorizationStatus)
        model.locationPublisher().compactMap { $0.last }.assign(to: &$location)
    }

    func deactivate() {
        guard isActive else { return }
    }

    func startTracking() {
        model.startTracking()
    }

    func stopTracking() {
        model.stopTracking()
    }
}
