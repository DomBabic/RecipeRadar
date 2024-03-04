//
//  MacroDataTests.swift
//  RecipeRadarTests
//
//  Created by Dominik Babic on 04.03.2024..
//

import XCTest
import SwiftUI
@testable import RecipeRadar

final class MacroDataTests: XCTestCase {
    
    func testInit() {
        let title = "Protein"
        let value = 20.0
        let total = 100.0
        let color = Color.red
        
        let macroData = MacroData(title: title, value: value, total: total, color: color)
        
        XCTAssertEqual(macroData.title, title)
        XCTAssertEqual(macroData.value, value)
        XCTAssertEqual(macroData.total, total)
        XCTAssertEqual(macroData.color, color)
        XCTAssertEqual(macroData.percentile, Int((value / total) * 100))
    }
    
    func testId() {
        let title = "Carbs"
        let macroData = MacroData(title: title, value: 30.0, total: 150.0, color: Color.blue)
        
        XCTAssertEqual(macroData.id, title)
    }
}
