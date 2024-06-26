//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/26/24.
//

import XCTest
@testable import TastyTradeAPI

final class EquitiesTest: XCTestCase {
    
    func testActiveEquitiesValid() async throws {
        try await TestAuthUtils.setupValidAuth()
        
        let (res, pag) = try await TastyAPI.activeEquities()
        
        XCTAssertEqual(res.count, pag.currentItemCount)
    }
    
    func testEquitiesValid() async throws {
        try await TestAuthUtils.setupValidAuth()
        
        let res = try await TastyAPI.equities(symbol: ["AAPL"])
        
        for item in res {
            XCTAssertEqual(item.symbol, "AAPL")
        }
    }
    
    func testEquitiesSingleValid() async throws {
        try await TestAuthUtils.setupValidAuth()
        
        let res = try await TastyAPI.equities(symbol: "AAPL")
        
        XCTAssertEqual(res.symbol, "AAPL")
    }
    
}
