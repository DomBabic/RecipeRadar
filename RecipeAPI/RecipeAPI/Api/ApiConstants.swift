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
    
    /// Enum containing API specific constants.
    ///
    /// Normally, any sensitive information would be stored in XCConfig file.
    /// Config file would then be assigned to specific target, and any keys
    /// would be referenced via property list of the bundle.
    public struct Api {
        /// Application ID used in network requests.
        public static let appId = "4dbab113"
        /// Application key used in network requests.
        public static let appKey = "287d24a63cd5d2f89801a7506ba5b62b"
        /// Base API url used in network requests.
        public static let baseUrl = "https://api.edamam.com"
    }
}
