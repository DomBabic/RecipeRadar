//
//  RecipeDetailsViewModel.swift
//  RecipeRadar
//
//  Created by Dominik Babic on 04.03.2024..
//

import Foundation
import Combine
import RecipeData
import SwiftUI

/// ViewModel used to present `Recipe` information in detailed view.
final class RecipeDetailsViewModel: ObservableObject {
    
    // MARK: - Publishers
    /// URL pointing to image resource.
    @Published var image: String
    /// Title of the recipe.
    @Published var title: String
    /// Time it takes to prepare the meal.
    @Published var prepTime: String?
    /// Number of servings per meal.
    @Published var servings: Double
    /// Array of ingredients used to prepare the meal.
    @Published var ingredients: [Ingredient]
    
    /// ``MacroData`` array used to visualise macronutrient data through charts and info stacks.
    @Published var macroData: [MacroData]
    
    /// Array of `HealthLabel` cases displayed via UI.
    @Published var healthLabels: [HealthLabel]
    /// Array of `DietLabel` cases displayed via UI.
    @Published var dietLabels: [DietLabel]
    
    /// Default initialiser for ``RecipeDetailsViewModel``.
    ///
    /// - Parameters:
    ///     - recipe: `Recipe` data to be used in the associated View.
    init(recipe: Recipe) {
        self.image = recipe.image
        self.title = recipe.label
        
        if recipe.totalTime > 0 {
            self.prepTime = "\(Int(recipe.totalTime)) min."
        }
        
        let yield = recipe.yield
        self.servings = yield
        self.ingredients = recipe.ingredients
        
        let nutrients = recipe.totalNutrients
        let total = (nutrients.carbs.quantity + nutrients.fat.quantity + nutrients.protein.quantity) / yield
        
        let dataFor: (Nutrient, Color) -> MacroData = { (nutrient, color) in
            return .init(title: nutrient.label,
                         value: nutrient.quantity / yield,
                         total: total,
                         color: color)
        }
        
        self.macroData = [
            dataFor(nutrients.carbs, .blue),
            dataFor(nutrients.fat, .green),
            dataFor(nutrients.protein, .orange)
        ]
        
        self.healthLabels = recipe.healthLabels.filter { $0 != .unknown }
        self.dietLabels = recipe.dietLabels.filter { $0 != .unknown }
    }
}
