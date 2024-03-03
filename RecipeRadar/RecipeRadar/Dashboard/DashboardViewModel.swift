//
//  DashboardViewModel.swift
//  RecipeRadar
//
//  Created by Dominik Babic on 03.03.2024..
//

import Foundation
import Combine
import RecipeAPI
import RecipeData

final class DashboardViewModel: ObservableObject {
    
    // MARK: - Services
    let networkService: NetworkServiceProtocol
    
    // MARK: - Properties
    var cancellables = Set<AnyCancellable>()
    
    // MARK: - Publishers
    @Published var text: String = ""
    @Published var data: [Recipe] = []
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
        
        setupBinding()
    }
    
    private func setupBinding() {
        $text
            .removeDuplicates()
            .sink { [weak self] _ in
                self?.data = []
            }
            .store(in: &cancellables)
    }

    // TODO: Method for network request
}
