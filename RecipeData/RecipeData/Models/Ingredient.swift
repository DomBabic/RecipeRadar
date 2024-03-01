//
//  Ingredient.swift
//  RecipeData
//
//  Created by Dominik Babic on 01.03.2024..
//

import Foundation

/// Object representing a single ingredient used in meal preparation.
public struct Ingredient: Codable {
    /// Detailed description of the ingredient (e.g. "1/2 cup of olive oil").
    public let text: String
    /// Image resource for an ingredient.
    public let image: String
    
    enum CodingKeys: String, CodingKey {
        case text, image
    }
}
