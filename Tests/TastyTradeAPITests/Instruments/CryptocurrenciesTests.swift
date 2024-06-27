//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/26/24.
//

import XCTest
@testable import TastyTradeAPI

final class CryptocurrenciesTests: XCTestCase {
    
    func testCryptocurrenciesValid() async throws {
        try await TestAuthUtils.setupValidAuth()
        
        let res = try await TastyAPI.cryptocurrencies(symbol: ["DOGE/USD"])
        
        for item in res {
            XCTAssertEqual(item.symbol, "DOGE/USD")
        }
    }
    
    func testCryptocurrenciesSingleValid() async throws {
        try await TestAuthUtils.setupValidAuth()
        
        let res = try await TastyAPI.cryptocurrencies(symbol: "DOGE/USD")
        
        XCTAssertEqual(res.symbol, "DOGE/USD")
    }
    
}
