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

/// ViewModel used to handle business logic of DashboardView.
final class DashboardViewModel: ObservableObject {
    
    // MARK: - Services
    /// Service responsible for performing network requests.
    let networkService: NetworkServiceProtocol
    
    // MARK: - Properties
    /// Set used to store publisher subscriptions.
    var cancellables = Set<AnyCancellable>()
    
    // MARK: - Publishers
    /// String representing user's query, updated via `TextField`.
    @Published var text: String = ""
    /// An array of `Recipe` objects presented through the UI.
    @Published var data: [Recipe] = []
    
    /// Flag indicating whether or not search query has changed.
    @Published var didChange = false
    /// Flag indicating whether or not there are more available results.
    @Published var hasMore = true
    
    /// Indicates selected recipe
    @Published var selectedRecipe: Recipe?
    
    /// Error indicating that something went wrong when fetching data.
    @Published var error: Error?
    
    /// Integer representing the start of the results page.
    var pageStart = 0
    /// Integer representing the end of the results page.
    var pageEnd = 10
    
    /// Default initialiser for ``DashboardViewModel`` class.
    ///
    /// - Parameters:
    ///     - networkService: Service responsible for performing network requests.
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
        
        setupBinding()
    }
    
    /// Method used to setup observables.
    private func setupBinding() {
        $text
            .removeDuplicates()
            .sink { [weak self] _ in
                self?.resetPage()
            }
            .store(in: &cancellables)
    }
    
    /// Method used to fetch data from the API.
    ///
    /// Method instructs ``networkService`` to perform network requests to fetch
    /// the recipe data from the API. If the query String changes between two requests,
    /// pagination is reset to start from 0. Any subsequent requests for the same query
    /// will produce more results for the same input.
    @MainActor
    func fetchData() async {
        do {
            guard hasMore || didChange else { return }
            
            let route = RecipeRoute(recipe: text, from: pageStart, to: pageEnd)
            let url = try route.apiURL()
            let request = URLRequest(url: url)
            
            let recipeList: RecipeList = try await networkService.request(request)
            
            let newRecipes = recipeList.hits.map { $0.recipe }
            
            if didChange {
                data = newRecipes
            } else {
                data += newRecipes
            }
            
            let totalCount = recipeList.count
            hasMore = recipeList.more
            didChange = false
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
    
    /// Method used to reset pagination.
    func resetPage() {
        didChange = true
        pageStart = 0
        pageEnd = 10
    }
}
