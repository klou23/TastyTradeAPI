//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/23/24.
//

import XCTest
@testable import TastyTradeAPI

final class BalanceSnapshotsTests: XCTestCase {
    
    func testBalanceSnapshotsValid() async throws {
        try await TestAuthUtils.setupValidAuth()
        
        let (res, pag) = try await TastyAPI.balanceSnapshots(accountNumber: "5WZ06754", timeOfDay: "EOD")
        
        XCTAssertEqual(res.count, pag.currentItemCount)
    }
    
}
