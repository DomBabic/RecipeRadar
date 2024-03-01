//
//  RecipeRoute.swift
//  RecipeAPI
//
//  Created by Dominik Babic on 01.03.2024..
//

import Foundation

public struct RecipeRoute: ApiRouteProtocol {
    let recipe: String
    let from: Int
    let to: Int
    
    public var method: HttpMethod {
        .GET
    }
    
    public var path: String {
        "search"
    }
    
    public var query: QueryParameters? {
        var defaults = defaultQueryParameters
        
        let const = ApiConstants.Query.self
        
        defaults[const.query.rawValue] = recipe
        defaults[const.from.rawValue] = "\(from)"
        defaults[const.to.rawValue] = "\(to)"
        
        return defaults
    }
    
    public var headers: [HttpHeader] {
        []
    }
    
    public var body: Data? {
        nil
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
