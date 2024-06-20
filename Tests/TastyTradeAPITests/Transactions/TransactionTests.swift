//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/19/24.
//

import XCTest
@testable import TastyTradeAPI

final class TransactionTests: XCTestCase {
    
    /// Tests retrieving a transaction by id
    func testTransactionValid() async throws {
        let auth = TastyTradeAuth(
            login: "kevintest",
            password: "kevin-test-password",
            rememberMe: true
        )
        try await auth.login()
        
        TastyAPI.auth = auth
        let res = try await TastyAPI.transaction(accountNumber: "5WZ06754", id: 63358)
        
        XCTAssertEqual(res.accountNumber, "5WZ06754")
        XCTAssertEqual(res.id, 63358)
    }
    
    /// Tests retrieving trading status with invalid authentication
    func testTransactionInvalidAuth() async throws {
        let auth = TastyTradeAuth(
            login: "kevintest",
            password: "invalid-password",
            rememberMe: true
        )
        
        do {
            try await auth.login()
            XCTFail("No error thrown")
        } catch TastyAPI.ApiError.http401(code: _, message: _) {
            // should fall into this catch block
        } catch {
            XCTFail("Incorrect error thrown")
        }
        
        TastyAPI.auth = auth
        do {
            _ = try await TastyAPI.transaction(accountNumber: "5WZ06754", id: 63358)
            XCTFail("Incorrect error thrown")
        } catch TastyAPI.RequestError.noAuthorization {
            // should fall into this catch block
        } catch {
            XCTFail("Incorrect error thrown")
        }
    }
    
    /// Tests retrieving trading status with invalid account number
    func testTransactionInvalidAccountNumber() async throws {
        let auth = TastyTradeAuth(
            login: "kevintest",
            password: "kevin-test-password",
            rememberMe: true
        )
        try await auth.login()
        
        TastyAPI.auth = auth
        do {
            _ = try await TastyAPI.transaction(accountNumber: "invalid", id: 63358)
            XCTFail("No error thrown")
        } catch TastyAPI.ApiError.http404 {
            // should fall into this catch block
        } catch {
            XCTFail("Incorrect error thrown")
        }
    }
    
    /// Tests retrieving trading status with invalid transaction id
    func testTransactionInvalidTransactionId() async throws {
        let auth = TastyTradeAuth(
            login: "kevintest",
            password: "kevin-test-password",
            rememberMe: true
        )
        try await auth.login()
        
        TastyAPI.auth = auth
        do {
            _ = try await TastyAPI.transaction(accountNumber: "5WZ06754", id: 0)
            XCTFail("No error thrown")
        } catch TastyAPI.ApiError.http404 {
            // should fall into this catch block
        } catch {
            XCTFail("Incorrect error thrown")
        }
    }
    
}
