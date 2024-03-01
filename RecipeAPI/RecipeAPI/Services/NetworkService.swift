//
//  NetworkService.swift
//  RecipeAPI
//
//  Created by Dominik Babic on 01.03.2024..
//

import Foundation

/// Protocol which defines methods used for performing network requests.
public protocol NetworkServiceProtocol {
    func request<T: Codable>(_ urlRequest: URLRequest) async throws -> T
    func completableRequest(_ urlRequest: URLRequest) async throws
    
    static var decoder: JSONDecoder { get }
}

public final class NetworkService: NetworkServiceProtocol {
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()
    
    public func request<T: Codable>(_ urlRequest: URLRequest) async throws -> T {
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        let result = try NetworkService.decoder.decode(T.self, from: data)
        
        return result
    }
    
    public func completableRequest(_ urlRequest: URLRequest) async throws {
        _ = try await URLSession.shared.data(for: urlRequest)
        
        // Optionally handle response to confirm request was a success.
    }
}
