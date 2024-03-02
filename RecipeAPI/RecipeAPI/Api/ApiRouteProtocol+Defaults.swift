//
//  ApiRouteProtocol+Defaults.swift
//  RecipeAPI
//
//  Created by Dominik Babic on 01.03.2024..
//

import Foundation

extension ApiRouteProtocol {

    /// Bundle property list.
    private var info: [String: Any]? {
        return Bundle.main.infoDictionary
    }
    
    /// Base API URL.
    var baseURL: URL? {
        guard let baseString = info?["ApiBaseURL"] as? String,
              let url = URL(string: baseString) else {
            return nil
        }
        
        return url
    }
    
    /// Default query parameters used in every network request.
    var defaultQueryParameters: QueryParameters {
        guard let appId = info?["AppId"] as? String,
              let appKey = info?["AppKey"] as? String else {
            return [:]
        }
        
        let params: QueryParameters = [
            ApiConstants.Query.appId: appId,
            ApiConstants.Query.appKey: appKey
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
