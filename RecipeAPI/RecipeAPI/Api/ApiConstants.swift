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
    public struct Query {
        /// Represents App ID key.
        public static let appId = "app_id"
        /// Represents App Key.
        public static let appKey = "app_key"
        /// Represents query page start key.
        public static let from = "from"
        /// Represents query page end key.
        public static let to = "to"
        /// Represents a query key.
        public static let query = "q"
    }
}
