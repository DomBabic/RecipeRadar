//
//  ApiRouteProtocol+Defaults.swift
//  RecipeAPI
//
//  Created by Dominik Babic on 01.03.2024..
//

import Foundation

extension ApiRouteProtocol {
    
    /// Base API URL.
    var baseURL: URL? {
        URL(string: ApiConstants.Api.baseUrl)
    }
    
    /// Default query parameters used in every network request.
    var defaultQueryParameters: QueryParameters {
        let query = ApiConstants.Query.self
        let api = ApiConstants.Api.self
        
        let params: QueryParameters = [
            query.appId: api.appId,
            query.appKey: api.appKey
        ]
        
        return params
    }
    
    /// Default HTTP header fields used in every network request.
    var defaultHeaders: [HttpHeader] {
        var basicHeaders: [HttpHeader] = [
            .init(field: .contentType, value: MimeType.json.rawValue)
        ]
        
        if body == nil {
            basicHeaders.append(.init(field: .contentLength, value: "0"))
        }
        
        return basicHeaders
    }
}
