//
//  swiftui_geo_locationApp.swift
//  swiftui-geo-location
//
//  Created by yorifuji on 2021/05/16.
//

import SwiftUI

@main
struct swiftui_geo_locationApp: App {
    @StateObject var viewModel = ViewModel(model: LocationDataSource())
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }
    }
}
