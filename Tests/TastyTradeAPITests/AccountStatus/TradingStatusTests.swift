//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/18/24.
//

import XCTest
@testable import TastyTradeAPI

final class TradingStatusTests: XCTestCase {
    
    /// Tests retrieving trading status
    func testTradingStatusValid() async throws {
        try await TestAuthUtils.setupValidAuth()
        
        let res = try await TastyAPI.tradingStatus(accountNumber: "5WZ06754")
        
        XCTAssertEqual(res.accountNumber, "5WZ06754")
    }
    
    /// Tests retrieving trading status with invalid authentication
    func testTradingStatusInvalidAuth() async throws {
        try await TestAuthUtils.setupInvalidAuth()
       
        await TestAssertUtils.assertThrowsAsync(
            try await TastyAPI.tradingStatus(accountNumber: "5WZ06754"),
            TastyAPI.RequestError.noAuthorization
        )
    }
    
    /// Tests retrieving trading status with invalid account number
    func testTradingStatusWithInvalidAccountNumber() async throws {
        try await TestAuthUtils.setupValidAuth()
        
        await TestAssertUtils.assertThrowsAsync(
            try await TastyAPI.tradingStatus(accountNumber: "invalid"),
            TastyAPI.ApiError.http404
        )
    }
    
}
