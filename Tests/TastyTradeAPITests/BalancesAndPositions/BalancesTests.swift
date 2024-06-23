//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/23/24.
//

import XCTest
@testable import TastyTradeAPI

final class BalancesTests: XCTestCase {
    
    /// Tests getting balances
    func testBalancesValid() async throws {
        try await TestAuthUtils.setupValidAuth()
        
        let res = try await TastyAPI.balances(accountNumber: "5WZ06754")
        
        XCTAssertEqual(res.accountNumber, "5WZ06754")
    }
    
}
