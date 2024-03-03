//
//  RecipeRadarApp.swift
//  RecipeRadar
//
//  Created by Dominik Babic on 02.03.2024..
//

import SwiftUI
import RecipeAPI

@main
struct RecipeRadarApp: App {
    var body: some Scene {
        WindowGroup {
            DashboardView(viewModel: .init(networkService: NetworkService()))
        }
    }
}
