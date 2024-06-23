//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/23/24.
//

import XCTest
@testable import TastyTradeAPI

final class PositionsTests: XCTestCase {
    
    func testPositionsValid() async throws {
        try await TestAuthUtils.setupValidAuth()
        
        let res = try await TastyAPI.positions(accountNumber: "5WZ06754")
        
        for position in res {
            XCTAssertEqual(position.accountNumber, "5WZ06754")
        }
    }
    
}
