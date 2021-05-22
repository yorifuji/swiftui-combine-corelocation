//
//  LocationDataSource.swift
//  swiftui-geo-location
//
//  Created by yorifuji on 2021/05/16.
//

import CoreLocation
import Combine

final class LocationDataSource: NSObject {
    private let subject: PassthroughSubject<[CLLocation], Never> = .init()
    private let locationManager = CLLocationManager()

    override init() {
        super.init()
        locationManager.delegate = self
    }

    func requestAuthorization() {
        if locationManager.authorizationStatus == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
        }
    }

    func startTracking() -> AnyPublisher<[CLLocation], Never> {
        locationManager.startUpdatingLocation()
        return subject.eraseToAnyPublisher()
    }

    func stopTracking() {
        locationManager.stopUpdatingLocation()
//        subject.send(completion: .finished)
    }
}

extension LocationDataSource: CLLocationManagerDelegate {
//    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
//        print(manager.authorizationStatus)
//    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        subject.send(locations)
    }
}
