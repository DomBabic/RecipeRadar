//
//  RecipeList.swift
//  RecipeData
//
//  Created by Dominik Babic on 01.03.2024..
//

import Foundation

/// An object representing paged data for user's query.
///
/// ``RecipeList`` contains information on the query, start and end of the page, total number of results, and found results.
public struct RecipeList: Codable {
    /// Represents user's query.
    public let q: String
    /// Start point of the result list.
    public let from: Int
    /// End point of the result list.
    public let to: Int
    /// Flag indicating whether or not there are more results available.
    public let more: Bool
    /// Integer indicating the number of results for the query.
    public let count: Int
    /// An array of ``RecipeResult`` objects for user's query.
    public let hits: [RecipeResult]
    
    enum CodingKeys: String, CodingKey {
        case q, from, to, more, count, hits
    }
}
