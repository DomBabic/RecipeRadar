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
        XCTAssertEqual(searchTextField.label, "")
        
        searchTextField.tap()
        
        searchTextField.typeText("Chicken")
        
        try await Task.sleep(nanoseconds: 500000000)
        
        XCTAssertEqual(searchTextField.label, "Chicken")
        
        searchTextField
    }
}
