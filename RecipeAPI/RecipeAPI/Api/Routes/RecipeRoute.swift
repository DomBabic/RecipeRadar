//
//  RecipeRoute.swift
//  RecipeAPI
//
//  Created by Dominik Babic on 01.03.2024..
//

import Foundation

/// Route used with recipe search API.
public struct RecipeRoute: ApiRouteProtocol {
    /// User's query for a recipe (e.g. `chicken`).
    let recipe: String
    /// Start index of results, used for paging data.
    let from: Int
    /// End index of results, used for paging data.
    let to: Int
    
    public var method: HttpMethod { .GET }
    
    public var path: String { "search" }
    
    public var query: QueryParameters? {
        var defaults = defaultQueryParameters
        
        let const = ApiConstants.Query.self
        
        defaults[const.query] = recipe
        defaults[const.from] = "\(from)"
        defaults[const.to] = "\(to)"
        
        return defaults
    }
    
    public var headers: [HttpHeader] { defaultHeaders }
    
    public var body: Data? { nil }
    
    public init(recipe: String, from: Int, to: Int) {
        self.recipe = recipe
        self.from = from
        self.to = to
    }
}

//
// Below is an example of how different routes for the same API can be implemented using enums.
//
//public enum SomeRoute: ApiRouteProtocol {
//    case getData
//    case putData(data: Data)
//    case postData(data: Data)
//    case delete(dataId: String)
//    
//    public var method: HttpMethod {
//        switch self {
//        case .getData:
//            return .GET
//        case .putData:
//            return .PUT
//        case .postData:
//            return .POST
//        case .delete:
//            return .DELETE
//        }
//    }
//    
//    public var path: String {
//        switch self {
//        case .getData:
//            return "v2/data"
//        case .putData(let data):
//            return "v2/data"
//        case .postData(let data):
//            return "v2/data"
//        case .delete(let dataId):
//            return "v1/data"
//        }
//    }
//    
//    public var query: QueryParameters? { nil }
//
//    public var headers: [HttpHeader] { [] }
//
//    public var body: Data? { nil }
//}
