//
//  ContentView.swift
//  swiftui-combine-location
//
//  Created by yorifuji on 2021/05/16.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        VStack(spacing: 16) {
            HStack(spacing: 16) {
                Button("request") {
                    viewModel.requestAuthorization()
                }
                Button("start") {
                    viewModel.startTracking()
                }
                Button("stop") {
                    viewModel.stopTracking()
                }
            }
            Text(viewModel.authorizationStatus.description)
            Text(String(format: "longitude: %f", viewModel.longitude))
            Text(String(format: "latitude: %f", viewModel.latitude))
        }.onAppear {
            viewModel.activate()
        }.onDisappear {
            viewModel.deactivate()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let viewModel = ViewModel(model: LocationDataSource())
    static var previews: some View {
        ContentView(viewModel: viewModel)
    }
}
