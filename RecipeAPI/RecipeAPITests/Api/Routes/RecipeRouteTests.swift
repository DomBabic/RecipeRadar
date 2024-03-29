//
//  RecipeRouteTests.swift
//  RecipeAPITests
//
//  Created by Dominik Babic on 02.03.2024..
//

import XCTest
@testable import RecipeAPI

final class RecipeRouteTests: XCTestCase {
    
    let route = RecipeRoute(recipe: "chicken", from: 0, to: 1)

    func testMethod() {
        XCTAssertEqual(route.method, .GET)
    }

    func testPath() {
        XCTAssertEqual(route.path, "search")
    }
    
    func testQuery() {
        guard let query = route.query else {
            XCTFail("Expected query parameters not found.")
            return
        }
        
        let const = ApiConstants.Query.self
        
        let exp = Set([
            const.appId,
            const.appKey,
            const.from,
            const.to,
            const.query
        ])
        
        let act = Set(query.keys)
        
        XCTAssertEqual(exp, act)
        
        XCTAssertEqual(query[const.query], "chicken")
        XCTAssertEqual(query[const.from], "0")
        XCTAssertEqual(query[const.to], "1")
    }
    
    func testHeaders() {
        XCTAssertEqual(route.headers.count, 2)
        
        let exp = Set<HttpHeaderField>([.contentType, .contentLength])
        let act = Set(route.headers.map { $0.field })
        
        XCTAssertEqual(exp, act)
    }
    
    func testBody() {
        XCTAssertNil(route.body)
    }
    
    func testFormattedUrlString() throws {
        let formatted = try route.formattedUrlString()
        
        let exp = "https://api.edamam.com/search"
        let act = String(formatted.prefix(exp.count))
        
        XCTAssertEqual(act, exp)
        
        XCTAssertTrue(formatted.contains("q=chicken"))
        XCTAssertTrue(formatted.contains("\(ApiConstants.Query.appKey)=\(ApiConstants.Api.appKey)"))
        XCTAssertTrue(formatted.contains("\(ApiConstants.Query.appId)=\(ApiConstants.Api.appId)"))
        XCTAssertTrue(formatted.contains("\(ApiConstants.Query.from)=0"))
        XCTAssertTrue(formatted.contains("\(ApiConstants.Query.to)=1"))
    }
    
    func testApiURL() throws {
        let url = try route.apiURL()
        
        XCTAssertNotNil(url.query())
    }
}
