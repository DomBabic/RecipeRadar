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
    
    @Published var didChange = false
    @Published var hasMore = true
    
    @Published var error: Error?
    
    var pageStart = 0
    var pageEnd = 1
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
        
        setupBinding()
    }
    
    private func setupBinding() {
        $text
            .removeDuplicates()
            .sink { [weak self] _ in
                self?.didChange = true
                self?.resetPage()
            }
            .store(in: &cancellables)
    }
    
    // TODO: Method for network request
    @MainActor
    func fetchData() async {
        do {
            guard hasMore else { return }
            
            let route = RecipeRoute(recipe: text, from: pageStart, to: pageEnd)
            let url = try route.apiURL()
            let request = URLRequest(url: url)
            
            let recipeList: RecipeList = try await networkService.request(request)
            
            data = recipeList.hits.map { $0.recipe }
            
            let totalCount = recipeList.count
            hasMore = recipeList.more
            pageStart = pageEnd
            
            if pageEnd + 10 < totalCount {
                pageEnd += 10
            } else {
                pageEnd = totalCount
            }
        } catch let apiError {
            error = apiError
        }
    }
    
    func resetPage() {
        didChange = false
        pageStart = 0
        pageEnd = 10
    }
}
