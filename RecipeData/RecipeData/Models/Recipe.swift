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
    /// ``Nutrients`` object containing total daily intake for each individual macro nutrient.
    public let totalDaily: Nutrients
    /// Time it takes to prepare a meal.
    public let totalTime: Double
    
    enum CodingKeys: String, CodingKey {
        case label
        case image
        case url
        case yield
        case ingredients
        case totalNutrients
        case totalDaily
        case totalTime
    }
}

extension Recipe: Identifiable {
    public var id: UUID { UUID() }
}

extension Recipe: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(label)
        hasher.combine(image)
        hasher.combine(url)
        hasher.combine(yield)
    }
    
    public static func == (lhs: Recipe, rhs: Recipe) -> Bool {
        return lhs.label == rhs.label &&
            lhs.image == rhs.image &&
            lhs.url == rhs.url &&
            lhs.yield == rhs.yield
    }
}
