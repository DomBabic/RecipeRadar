//
//  Nutrient.swift
//  RecipeData
//
//  Created by Dominik Babic on 01.03.2024..
//

import Foundation

/// Object representing a nutrient data.
///
/// Used for total energy, fat, protein, and carbs.
public struct Nutrient: Codable {
    /// Name of the nutrient (e.g. `energy`, `fat`, etc.).
    public let label: String
    /// Number representing the amount of a given nutrient.
    public let quantity: Double
    /// Unit name for the given nutrient (e.g. `kcal`, `g`, `mg`, etc.).
    public let unit: String
    
    enum CodingKeys: String, CodingKey {
        case label, quantity, unit
    }
}
