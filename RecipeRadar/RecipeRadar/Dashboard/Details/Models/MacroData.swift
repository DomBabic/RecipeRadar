//
//  MacroData.swift
//  RecipeRadar
//
//  Created by Dominik Babic on 04.03.2024..
//

import Foundation
import SwiftUI

/// Model used in creation of charts and macronutrient information stacks.
struct MacroData: Identifiable {
    /// Name of the macronutrient (e.g. "Carbs").
    var title: String
    /// Macro amount expressed in grams.
    var value: Double
    /// Total value of all macronutrients.
    var total: Double
    /// Tint color associated with macronutrient.
    var color: Color
    
    /// Percentile representation of given macronutrient in combined total of all macros.
    var percentile: Int
    
    /// Default initialiser for ``MacroData``.
    ///
    /// - Parameters:
    ///     - title: String representing the name of the macro.
    ///     - value: Double value representing the amount of the macro expressed in grams.
    ///     - total: Double value representing the sum of all macros expressed in grams.
    ///     - color: Color associated with given macro.
    init(title: String, value: Double, total: Double, color: Color) {
        self.title = title
        self.value = value
        self.total = total
        self.color = color
        
        self.percentile = Int((value / total) * 100)
    }
    
    /// Identifiable conformance, used in SwiftUI loop structs, matches ``title``.
    var id: String { title }
}
