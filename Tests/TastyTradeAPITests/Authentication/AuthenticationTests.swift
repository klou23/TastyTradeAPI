//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/17/24.
//

import XCTest
@testable import TastyTradeAPI

final class AuthenticationTests: XCTestCase {
    
    /// Tests authentication with a remember token using a valid login and valid password
    func testValidLoginWithPasswordAndRemember() async throws {
        try await TestAuthUtils.setupValidAuth()
    }
    
    /// Tests authenication without a rememberToken using a valid login and valid password
    func testValidLoginWithPasswordNoRemember() async throws {
        try await TestAuthUtils.setupValidAuth(remember: false)
    }
    
    /// Tests authentication with an invalid password
    func testInvalidLoginWithPassword() async throws {
        try await TestAuthUtils.setupInvalidAuth()
    }
    
    /// Tests authentication using a valid login and valid remember token
    /// Will fail if testValidLoginWithPasswordAndRemember fails
    func testValidLoginWithRememberToken() async throws {
        try await TestAuthUtils.setupValidAuth()
        
        // store original tokens
        let origToken = TastyAPI.auth!.token!
        let origRemember = TastyAPI.auth!.rememberToken!
        
        // generate new token using remember
        try await TastyAPI.auth!.login()
        XCTAssertNotNil(TastyAPI.auth!.token)
        XCTAssertNotNil(TastyAPI.auth!.rememberToken)
        XCTAssertNotEqual(TastyAPI.auth!.token, origToken)
        XCTAssertNotEqual(TastyAPI.auth!.rememberToken, origRemember)
    }
}
