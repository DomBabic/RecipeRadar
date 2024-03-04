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

struct MacroData: Identifiable {
    var title: String
    var value: Double
    var total: Double
    var color: Color
    
    var percentile: Int
    
    init(title: String, value: Double, total: Double, color: Color) {
        self.title = title
        self.value = value
        self.total = total
        self.color = color
        
        self.percentile = Int((value / total) * 100)
    }
    
    var id: String { title }
}

final class RecipeDetailsViewModel: ObservableObject {
    
    // MARK: - Publishers
    @Published var image: String
    @Published var title: String
    @Published var servings: Double
    @Published var ingredients: [Ingredient]
    
    @Published var totalAmount: Double
    @Published var macroData: [MacroData]
    
    init(recipe: Recipe) {
        self.image = recipe.image
        self.title = recipe.label
        let yield = recipe.yield
        self.servings = yield
        self.ingredients = recipe.ingredients
        
        let nutrients = recipe.totalNutrients
        let total = (nutrients.carbs.quantity + nutrients.fat.quantity + nutrients.protein.quantity) / yield
        self.totalAmount = total
        
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
    }
}
