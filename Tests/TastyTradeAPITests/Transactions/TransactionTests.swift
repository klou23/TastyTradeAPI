//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/19/24.
//

import XCTest
@testable import TastyTradeAPI

final class TransactionTests: XCTestCase {
    
    /// Tests retrieving trading status with invalid authentication
    func testTransactionInvalidAuth() async throws {
        try await TestAuthUtils.setupInvalidAuth()
        
        await TestAssertUtils.assertThrowsAsync(
            try await TastyAPI.transaction(accountNumber: "5WZ06754", id: 63358),
            TastyAPI.RequestError.noAuthorization
        )
    }
    
    /// Tests retrieving trading status with invalid account number
    func testTransactionInvalidAccountNumber() async throws {
        try await TestAuthUtils.setupValidAuth()
        
        await TestAssertUtils.assertThrowsAsync(
            try await TastyAPI.transaction(accountNumber: "invalid", id: 63358),
            TastyAPI.ApiError.http404
        )
    }
    
    /// Tests retrieving trading status with invalid transaction id
    func testTransactionInvalidTransactionId() async throws {
        try await TestAuthUtils.setupValidAuth()
        
        await TestAssertUtils.assertThrowsAsync(
            try await TastyAPI.transaction(accountNumber: "5WZ06754", id: 0),
            TastyAPI.ApiError.http404
        )
    }
    
}
