//
//  DashboardViewUITests.swift
//  RecipeRadarUITests
//
//  Created by Dominik Babic on 04.03.2024..
//

import XCTest

final class DashboardViewUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
        
        try super.setUpWithError()
    }

    @MainActor
    func testExample() async throws {
        let app = XCUIApplication()
        app.launch()

        let title = app.staticTexts["dashboard.title"]
        
        XCTAssertTrue(title.exists)
        XCTAssertEqual(title.label, "Recipe Radar")
        
        let searchButton = app.buttons["dashboard.searchBar"]
        
        XCTAssertTrue(searchButton.exists)
        
        let searchTextField = app.textFields["dashboard.searchBar"]
        
        XCTAssertTrue(searchTextField.exists)
        
        searchTextField.tap()
        
        searchTextField.typeText("Chicken")
        
        try await Task.sleep(nanoseconds: 1000000000)
        
        searchButton.tap()
        
        let predicate = NSPredicate(format: "exists == true")
        let viewExistenceExpectation = expectation(for: predicate,
                                                   evaluatedWith: app.scrollViews["dashboard.dataView"],
                                                   handler: nil)

        await fulfillment(of: [viewExistenceExpectation], timeout: 5)
        
        let scrollView = app.scrollViews["dashboard.dataView"]
        
        XCTAssertTrue(scrollView.exists)
        
        scrollView.swipeUp()
        
        let showMore = app.buttons["dashboard.showMore"]
        
        XCTAssertTrue(showMore.exists)
        
        let grid = scrollView.otherElements["dashboard.grid"]
        
        XCTAssertTrue(grid.exists)
        
        let gridItem = grid.staticTexts["recipe.gridItem.title"].firstMatch
        
        XCTAssertTrue(gridItem.exists)
        
        gridItem.tap()
        
        try await Task.sleep(nanoseconds: 1000000000)
        
        let detailsTitle = app.staticTexts["details.title"]
        
        XCTAssertTrue(detailsTitle.exists)
        XCTAssertEqual(detailsTitle.label, gridItem.label)
    }
}

