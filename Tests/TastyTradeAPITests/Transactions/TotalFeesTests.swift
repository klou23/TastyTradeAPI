//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/21/24.
//

import XCTest
@testable import TastyTradeAPI

final class TotalFeesTests: XCTestCase {
    
    /// Tests retrieving total fees for today
    func testTotalFeesValid() async throws {
        try await TestAuthUtils.setupValidAuth()
        
        let res = try await TastyAPI.totalFees(accountNumber: "5WZ06754")
        
        // no value check because fees could depend on tests run
        XCTAssertNotNil(res.totalFees)
    }
    
    /// Tests retrieving total fees for today with invalid authentication
    func testTotalFeesInvalidAuth() async throws {
        try await TestAuthUtils.setupInvalidAuth()
        
        await TestAssertUtils.assertThrowsAsync(
            try await TastyAPI.totalFees(accountNumber: "5WZ06754"),
            TastyAPI.RequestError.noAuthorization
        )
    }
    
    /// Tests retrieving total fees for today with no authentication
    func testTotalFeesNoAuth() async throws {
        TastyAPI.auth = nil
        
        await TestAssertUtils.assertThrowsAsync(
            try await TastyAPI.totalFees(accountNumber: "5WZ06754"),
            TastyAPI.RequestError.noAuthorization
        )
    }
    
    /// Tests retrieving total fees for today with invalid account number
    func testTotalFeesInvalidAccountNumber() async throws {
        try await TestAuthUtils.setupValidAuth()
        
        await TestAssertUtils.assertThrowsAsync(
            try await TastyAPI.totalFees(accountNumber: "invalid"),
            TastyAPI.ApiError.http404
        )
    }
    
    /// Tests retrieving total fees for a set date
    func testTotalFeesValidWithDate() async throws {
        try await TestAuthUtils.setupValidAuth()
        
        let res = try await TastyAPI.totalFees(accountNumber: "5WZ06754", date: "2024-01-01")
        
        // no value check because fees could depend on tests run
        XCTAssertNotNil(res.totalFees)
    }
    
    /// Tests retrieving total fees with an invalid date
    func testTotalFeesInvalidDate() async throws {
        try await TestAuthUtils.setupValidAuth()
        
        await TestAssertUtils.assertThrowsAsync(
            try await TastyAPI.totalFees(accountNumber: "5WZ06754", date: "1"),
            TastyAPI.ApiError.http400(code: "validation_error", message:"Request validation failed")
        )
        
    }
    
}
