//
//  ViewModel.swift
//  swiftui-geo-location
//
//  Created by yorifuji on 2021/05/20.
//

import CoreLocation
import Combine

final class ViewModel: NSObject, ObservableObject {
    let model: LocationDataSource
    var cancelable: AnyCancellable?
    @Published var lastLocation: CLLocation = .init()

    init(model: LocationDataSource) {
        self.model = model
    }

    func request() {
        model.requestAuthorization()
    }

    func start() {
        cancelable = model.startTracking().print("debug").sink { [weak self] locations in
            guard let self = self else { return }
            print("ViewMode: start: \(locations)")
            if let last = locations.last {
                self.lastLocation = last
            }
        }
    }

    func stop() {
        model.stopTracking()
        cancelable?.cancel()
    }

    var latitude: CLLocationDegrees {
        lastLocation.coordinate.latitude
    }

    var longitude: CLLocationDegrees {
        lastLocation.coordinate.longitude
    }
}
