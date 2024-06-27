//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/26/24.
//

import XCTest
@testable import TastyTradeAPI

final class FuturesTests: XCTestCase {
    
    func testFuturesValid() async throws {
        try await TestAuthUtils.setupValidAuth()
        
        let res = try await TastyAPI.futures(symbol: ["ESZ6"])
        
        for item in res {
            XCTAssertEqual(item.symbol, "/ESZ6")
            XCTAssertEqual(item.futureEtfEquivalent?.symbol, "SPY")
        }
    }
    
    func testFuturesSingleValid() async throws {
        try await TestAuthUtils.setupValidAuth()
        
        let res = try await TastyAPI.futures(symbol: "ESZ6")
        
        XCTAssertEqual(res.symbol, "/ESZ6")
        XCTAssertEqual(res.futureEtfEquivalent?.symbol, "SPY")
    }
    
}
