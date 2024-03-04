//
//  HealthLabel.swift
//  RecipeData
//
//  Created by Dominik Babic on 04.03.2024..
//

import Foundation

/// Enum representing the health label used for a given ``Recipe``.
public enum HealthLabel: String, Codable, CaseIterableDefaultFirst {
    /// Default unknown case.
    case unknown
    /// Label used for vegan ``Recipe``.
    case vegan = "Vegan"
    /// Label used for vegetarian ``Recipe``.
    case vegetarian = "Vegetarian"
    /// Label used for paleo ``Recipe``.
    case paleo = "Paleo"
    /// Label used for dairy-free ``Recipe``.
    case dairyFree = "Dairy-Free"
    /// Label used for gluten-free ``Recipe``.
    case glutenFree = "Gluten-Free"
    /// Label used for wheat-free ``Recipe``.
    case wheatFree = "Wheat-Free"
    /// Label used for fat-free ``Recipe``.
    case fatFree = "Fat-Free"
    /// Label used for low-sugar ``Recipe``.
    case lowSugar = "Low Sugar"
    /// Label used for egg-free ``Recipe``.
    case eggFree = "Egg-Free"
    /// Label used for peanut-free ``Recipe``.
    case peanutFree = "Peanut-Free"
    /// Label used for nut-free ``Recipe``.
    case treeNutFree = "Tree-Nut-Free"
    /// Label used for soy-free ``Recipe``.
    case soyFree = "Soy-Free"
    /// Label used for fish-free ``Recipe``.
    case fishFree = "Fish-Free"
    /// Label used for shellfish-free ``Recipe``.
    case shellfishFree = "Shellfish-Free"
}
