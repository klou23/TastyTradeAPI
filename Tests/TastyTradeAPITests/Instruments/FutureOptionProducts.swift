//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/28/24.
//

import XCTest
@testable import TastyTradeAPI

final class FutureOptionProducts: XCTestCase {
    
    func testFutureOptionProductsValid() async throws {
        try await TestAuthUtils.setupValidAuth()
        
        let res = try await TastyAPI.futureOptionProducts()
        
        XCTAssertNotEqual(res.count, 0)
    }
    
    func testFutureOptionProductsSingleValid() async throws {
        try await TestAuthUtils.setupValidAuth()
        
        let res = try await TastyAPI.futureOptionProducts(exchange: "CME", rootSymbol: "ES")
        
        XCTAssertEqual(res.exchange, "CME")
        XCTAssertEqual(res.rootSymbol, "ES")
    }
    
}
