//
//  Nutrients.swift
//  RecipeData
//
//  Created by Dominik Babic on 01.03.2024..
//

import Foundation

/// Object containing data on the meal nutrients.
public struct Nutrients: Codable {
    /// ``Nutrient`` object containing information on the total energy value of the meal.
    public let energy: Nutrient
    /// ``Nutrient`` object containing information on the total amount of fat in the meal.
    public let fat: Nutrient
    /// ``Nutrient`` object containing information on the total amount of carbs in the meal.
    public let carbs: Nutrient
    /// ``Nutrient`` object containing information on the total amount of protein in the meal.
    public let protein: Nutrient
    
    enum CodingKeys: String, CodingKey {
        case energy = "ENERC_KCAL"
        case fat = "FAT"
        case carbs = "CHOCDF"
        case protein = "PROCNT"
    }
}
