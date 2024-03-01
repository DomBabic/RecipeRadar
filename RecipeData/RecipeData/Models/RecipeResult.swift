//
//  Recipe.swift
//  RecipeData
//
//  Created by Dominik Babic on 01.03.2024..
//

import Foundation

/// Object representing a single result.
public struct RecipeResult: Codable {
    /// Represents a ``Recipe`` object containing all the information about the meal.
    public  let recipe: Recipe
    
    enum CodingKeys: String, CodingKey {
        case recipe
    }
}
