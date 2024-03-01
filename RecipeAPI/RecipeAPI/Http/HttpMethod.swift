//
//  HttpMethod.swift
//  RecipeAPI
//
//  Created by Dominik Babic on 04.12.2023..
//

import Foundation

/// Enum which defines HTTP methods used in requests.
public enum HttpMethod: String {
    /// Defines `HEAD` method.
    case HEAD
    /// Defines `GET` method.
    case GET
    /// Defines `POST` method.
    case POST
    /// Defines `PUT` method.
    case PUT
    /// Defines `DELETE` method.
    case DELETE
}
