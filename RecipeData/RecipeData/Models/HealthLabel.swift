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
    case vegan
    /// Label used for vegetarian ``Recipe``.
    case vegetarian
    /// Label used for paleo ``Recipe``.
    case paleo
    /// Label used for dairy-free ``Recipe``.
    case dairyFree = "dairy-free"
    /// Label used for gluten-free ``Recipe``.
    case glutenFree = "gluten-free"
    /// Label used for wheat-free ``Recipe``.
    case wheatFree = "wheat-free"
    /// Label used for fat-free ``Recipe``.
    case fatFree = "fat-free"
    /// Label used for low-sugar ``Recipe``.
    case lowSugar = "low-sugar"
    /// Label used for egg-free ``Recipe``.
    case eggFree = "egg-free"
    /// Label used for peanut-free ``Recipe``.
    case peanutFree = "peanut-free"
    /// Label used for nut-free ``Recipe``.
    case treeNutFree = "tree-nut-free"
    /// Label used for soy-free ``Recipe``.
    case soyFree = "soy-free"
    /// Label used for fish-free ``Recipe``.
    case fishFree = "fish-free"
    /// Label used for shellfish-free ``Recipe``.
    case shellfishFree = "shellfish-free"
}
