//
//  DashboardViewModelTests.swift
//  RecipeRadarTests
//
//  Created by Dominik Babic on 04.03.2024..
//

import XCTest
@testable import RecipeRadar

class DashboardViewModelTests: XCTestCase {
    
    let networkService = MockNetworkService()
    
    var viewModel: DashboardViewModel!
    
    override func setUp() {
        super.setUp()
        networkService.returnData = recipeListData
        viewModel = DashboardViewModel(networkService: networkService)
    }
    
    func testFetchDataSuccess() async throws {
        await viewModel.fetchData()
        
        XCTAssertTrue(viewModel.data.count > 0)
        XCTAssertFalse(viewModel.hasMore)
        XCTAssertNil(viewModel.error)
    }
    
    func testFetchDataFailure() async throws {
        networkService.shouldFail = true
        await viewModel.fetchData()
        
        XCTAssertTrue(viewModel.showError)
        XCTAssertNotNil(viewModel.error)
        XCTAssertEqual(viewModel.data.count, 0)
    }
    
    func testResetPage() {
        viewModel.pageStart = 5
        viewModel.pageEnd = 15
        
        viewModel.resetPage()
        
        XCTAssertTrue(viewModel.didChange)
        XCTAssertEqual(viewModel.pageStart, 0)
        XCTAssertEqual(viewModel.pageEnd, 10)
    }
}

