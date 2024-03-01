//
//  ApiError.swift
//  RecipeAPI
//
//  Created by Dominik Babic on 01.03.2024..
//

import Foundation

/// API error enum used to notify of an issue
public enum ApiError: Error {
    /// Indicates that URL is invalid.
    case invalidUrl(url: String?)
    /// Indicates that data is malformed.
    case malformedData(data: Data)
}
