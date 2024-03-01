//
//  ApiConstants.swift
//  RecipeAPI
//
//  Created by Dominik Babic on 01.03.2024..
//

import Foundation

/// Struct representing API constants.
public struct ApiConstants {
    /// Enum representing query parameter key constants.
    public enum Query: String {
        /// Represents App ID key.
        case appId = "app_id"
        /// Represents App Key.
        case appKey = "app_key"
        /// Represents query page start key.
        case from
        /// Represents query page end key.
        case to
        /// Represents a query key.
        case query = "q"
    }
}
