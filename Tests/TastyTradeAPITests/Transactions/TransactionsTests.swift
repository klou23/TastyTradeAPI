//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/21/24.
//

import XCTest
@testable import TastyTradeAPI

final class TransactionsTests: XCTestCase {
    
    /// Tests retrieving all transactions
    func testTransactionsValid() async throws {
        try await TestAuthUtils.setupValidAuth()
        
        let (res, pag) = try await TastyAPI.transactions(accountNumber: "5WZ06754")
        
        XCTAssertEqual(res.count, pag.currentItemCount)
    }
    
    /// Tests retrieving all transactions with invalid auth
    func testTransactionsInvalidAuth() async throws {
        try await TestAuthUtils.setupInvalidAuth()
        
        await TestAssertUtils.assertThrowsAsync(
            try await TastyAPI.transactions(accountNumber: "5WZ06754"),
            TastyAPI.RequestError.noAuthorization
        )
    }
   
    /// Tests retrieving all transactions with invalid account number
    func testTransactionsInvalidAccountNumber() async throws {
        try await TestAuthUtils.setupValidAuth()
        
        await TestAssertUtils.assertThrowsAsync(
            try await TastyAPI.transactions(accountNumber: "invalid"),
            TastyAPI.ApiError.http404
        )
    }
    
    /// Tests retrieving all transactions with a per-page parameter
    func testTransactionsValidPerPage() async throws {
        try await TestAuthUtils.setupValidAuth()
        
        let (res, pag) = try await TastyAPI.transactions(
            accountNumber: "5WZ06754",
            perPage: 10
        )
        
        XCTAssertEqual(res.count, pag.currentItemCount)
        XCTAssertEqual(pag.perPage, 10)
    }
    
    /// Tests retrieving all transactions with a types parameter
    func testTransactionsValidTypes() async throws {
        try await TestAuthUtils.setupValidAuth()
        
        let (res, pag) = try await TastyAPI.transactions(
            accountNumber: "5WZ06754",
            types: ["Money Movement"]
        )
        
        XCTAssertEqual(res.count, pag.currentItemCount)
        for r in res {
            XCTAssertEqual(r.transactionType, "Money Movement")
        }
    }
}
