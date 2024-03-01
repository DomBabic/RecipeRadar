//
//  HttpHeader.swift
//  RecipeAPI
//
//  Created by Dominik Babic on 04.12.2023..
//

import Foundation

/// Struct which defines HTTP header for network request.
public struct HttpHeader {
    /// ``HttpHeaderField`` to set for network request.
    let field: HttpHeaderField
    /// Value of HTTP header field.
    let value: String
}
