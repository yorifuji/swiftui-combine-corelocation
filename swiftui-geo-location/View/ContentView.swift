//
//  ContentView.swift
//  swiftui-geo-location
//
//  Created by yorifuji on 2021/05/16.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        VStack {
            HStack(spacing: 16) {
                Button("request") {
                    viewModel.request()
                }
                Button("start") {
                    viewModel.start()
                }
                Button("stop") {
                    viewModel.stop()
                }
            }
            Text(String(format: "lon: %f", viewModel.lon))
            Text(String(format: "lat: %f", viewModel.lat))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let viewModel = ViewModel(model: LocationModel())
    static var previews: some View {
        ContentView(viewModel: viewModel)
    }
}
