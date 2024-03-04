//
//  DietLabel.swift
//  RecipeData
//
//  Created by Dominik Babic on 04.03.2024..
//

import Foundation

/// Enum representing the type of diet for a given ``Recipe``.
public enum DietLabel: String, Codable, CaseIterableDefaultFirst {
    /// Default unknown case.
    case unknown
    /// Represents balanced diet.
    case balanced
    /// Represents diet rich in protein.
    case highProtein = "high-protein"
    /// Represents diet rich in fiber.
    case highFiber = "high-fiber"
    /// Represents low-fat diet.
    case lowFat = "low-fat"
    /// Represents low-carb diet.
    case lowCarb = "low-carb"
    /// Represents low-sodium diet.
    case lowSodium = "low-sodium"
}
