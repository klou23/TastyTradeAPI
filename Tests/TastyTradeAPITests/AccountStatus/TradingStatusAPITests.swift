//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/18/24.
//

import XCTest
@testable import TastyTradeAPI

final class TradingStatusAPITests: XCTestCase {
    
    /// Tests retrieving trading status
    func testTradingStatusValid() async throws {
        let auth = TastyTradeAuth(
            login: "kevintest",
            password: "kevin-test-password",
            rememberMe: true
        )
        try await auth.login()
        
        TastyAPI.auth = auth
        let res = try await TastyAPI.tradingStatus(accountNumber: "5WZ06754")
        
        XCTAssertEqual(res.accountNumber, "5WZ06754")
    }
    
    /// Tests retrieving trading status with invalid authentication
    
    /// Tests retrieving trading status with invalid account number
    
}
