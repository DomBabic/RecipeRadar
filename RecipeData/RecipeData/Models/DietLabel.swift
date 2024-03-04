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
    case balanced = "Balanced"
    /// Represents diet rich in protein.
    case highProtein = "High-Protein"
    /// Represents diet rich in fiber.
    case highFiber = "High-Fiber"
    /// Represents low-fat diet.
    case lowFat = "Low-Fat"
    /// Represents low-carb diet.
    case lowCarb = "Low-Carb"
    /// Represents low-sodium diet.
    case lowSodium = "Low-Sodium"
}
