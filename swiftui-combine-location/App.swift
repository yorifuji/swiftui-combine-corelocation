//
//  App.swift
//  swiftui-combine-location
//
//  Created by yorifuji on 2021/05/16.
//

import SwiftUI

@main
struct MyApp: App {
    @StateObject var viewModel = ViewModel(model: LocationDataSource())
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }
    }
}
