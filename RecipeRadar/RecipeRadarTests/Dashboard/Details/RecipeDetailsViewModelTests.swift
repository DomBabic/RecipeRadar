//
//  RecipeDetailsViewModelTests.swift
//  RecipeRadarTests
//
//  Created by Dominik Babic on 04.03.2024..
//

import XCTest
import SwiftUI
@testable import RecipeData
@testable import RecipeRadar

final class RecipeDetailsViewModelTests: XCTestCase {

    func testRecipeDetailsViewModelInitialization() throws {
        let recipe = try JSONDecoder().decode(Recipe.self, from: recipeData)
        
        let viewModel = RecipeDetailsViewModel(recipe: recipe)
        
        XCTAssertEqual(viewModel.title, "Chicken Vesuvio")
        XCTAssertEqual(viewModel.servings, 4.0)
        XCTAssertEqual(viewModel.ingredients.count, 11)
        
        XCTAssertEqual(viewModel.macroData.count, 3)
        XCTAssertEqual(viewModel.macroData[0].title, "Carbs")
        XCTAssertEqual(viewModel.macroData[0].value, 180.0 / 4.0)
        XCTAssertEqual(viewModel.macroData[1].title, "Fat")
        XCTAssertEqual(viewModel.macroData[1].value, 280.0 / 4.0)
        XCTAssertEqual(viewModel.macroData[2].title, "Protein")
        XCTAssertEqual(viewModel.macroData[2].value, 230.0 / 4.0)
        
        XCTAssertEqual(viewModel.healthLabels.count, 9)
        XCTAssertEqual(viewModel.dietLabels.count, 1)
    }

}
