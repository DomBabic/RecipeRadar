//
//  MockNetworkService.swift
//  RecipeRadarTests
//
//  Created by Dominik Babic on 04.03.2024..
//

import Foundation
import RecipeAPI

final class MockNetworkService: NetworkServiceProtocol {
    
    var shouldFail = false
    var returnData: Data?
    
    static var decoder: JSONDecoder {
        JSONDecoder()
    }
    
    func request<T: Codable>(_ urlRequest: URLRequest) async throws -> T {
        guard !shouldFail, let data = returnData else {
            throw ApiError.malformedData(data: Data())
        }
        
        return try MockNetworkService.decoder.decode(T.self, from: data)
    }
    
    func completableRequest(_ urlRequest: URLRequest) async throws {
        if shouldFail {
            throw ApiError.malformedData(data: Data())
        }
    }
}
