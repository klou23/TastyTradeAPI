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
    func testTradingStatusInvalidAuth() async throws {
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
        
        do {
            _ = try await TastyAPI.tradingStatus(accountNumber: "5WZ06754")
            XCTFail("No error thrown")
        } catch TastyAPI.RequestError.noAuthorization {
            // should fall into this catch block
        } catch {
            XCTFail("Incorrect error thrown")
        }
    }
    
    /// Tests retrieving trading status with invalid account number
    func testTradingStatusWithInvalidAccountNumber() async throws {
        let auth = TastyTradeAuth(
            login: "kevintest",
            password: "kevin-test-password",
            rememberMe: true
        )
        try await auth.login()
        
        TastyAPI.auth = auth
        do {
            _ = try await TastyAPI.tradingStatus(accountNumber: "invalidAccountNumber")
            XCTFail("No error thrown")
        } catch TastyAPI.ApiError.http404 {
            // should fall into this catch block
        } catch {
            XCTFail("Incorrect error thrown")
        }
    }
    
}
