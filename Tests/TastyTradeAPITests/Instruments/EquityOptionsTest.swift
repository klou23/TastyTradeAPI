//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/26/24.
//

import XCTest
@testable import TastyTradeAPI

final class EquityOptionsTest: XCTestCase {
    
    func testEquityOptionsValid() async throws {
        try await TestAuthUtils.setupValidAuth()
        
        let res = try await TastyAPI.equityOptions(symbol: ["AAPL  261218C00200000"])
        
        for item in res {
            XCTAssertEqual(item.symbol, "AAPL  261218C00200000")
            XCTAssertEqual(item.underlyingSymbol, "AAPL")
            XCTAssertEqual(item.strikePrice, "200.0")
            XCTAssertEqual(item.expirationDate, "2026-12-18")
        }
    }
    
    func testEquityOptionSingleValid() async throws {
        try await TestAuthUtils.setupValidAuth()
        
        let res = try await TastyAPI.equityOptions(symbol: "AAPL  261218C00200000")
        
        XCTAssertEqual(res.symbol, "AAPL  261218C00200000")
        XCTAssertEqual(res.underlyingSymbol, "AAPL")
        XCTAssertEqual(res.strikePrice, "200.0")
        XCTAssertEqual(res.expirationDate, "2026-12-18")
    }
    
}
