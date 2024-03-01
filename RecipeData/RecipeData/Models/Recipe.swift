//
//  Recipe.swift
//  RecipeData
//
//  Created by Dominik Babic on 01.03.2024..
//

import Foundation

/// Object containing all the information about the meal.
public struct Recipe: Codable {
    /// Represents the name of the meal.
    public let label: String
    /// An image example of the prepared meal.
    public let image: String
    /// URL String which takes user to a page containing preparation instructions.
    public let url: String
    /// Double representing a number of servings.
    public let yield: Double
    /// An array of ``Ingredient`` objects.
    public let ingredients: [Ingredient]
    /// ``Nutrients`` object containing data on the meal macro and energy informations.
    public let totalNutrients: Nutrients
    
    enum CodingKeys: String, CodingKey {
        case label, image, url, yield, ingredients, totalNutrients
    }
}
