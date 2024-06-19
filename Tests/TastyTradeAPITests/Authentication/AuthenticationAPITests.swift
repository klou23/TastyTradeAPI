//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/17/24.
//

import XCTest
@testable import TastyTradeAPI

final class AuthenticationAPITests: XCTestCase {
    
    /// Tests authentication with a remember token using a valid login and valid password
    func testValidLoginWithPasswordAndRemember() async throws {
        let auth = TastyTradeAuth(
            login: "kevintest",
            password: "kevin-test-password",
            rememberMe: true,
            sandbox: true
        )
        try await auth.login()
        
        XCTAssertNotNil(auth.token)
        XCTAssertNotNil(auth.rememberToken)
    }
    
    /// Tests authenication without a rememberToken using a valid login and valid password
    func testValidLoginWithPasswordNoRemember() async throws {
        let auth = TastyTradeAuth(
            login: "kevintest",
            password: "kevin-test-password",
            rememberMe: false,
            sandbox: true
        )
        try await auth.login()
        
        XCTAssertNotNil(auth.token)
        XCTAssertNil(auth.rememberToken)
    }
    
    /// Tests authentication with an invalid password
    func testInvalidLoginWithPassword() async throws {
        let auth = TastyTradeAuth(
            login: "kevintest",
            password: "invalid-password",
            rememberMe: false,
            sandbox: true
        )
        
        do {
            try await auth.login()
            XCTFail("No error thrown")
        } catch AuthError.invalidCredentials(_) {
            // should fall into this catch block
        } catch {
            XCTFail("Incorrect error thrown")
        }
    }
    
    /// Tests authentication using a valid login and valid remember token
    /// Will fail if testValidLoginWithPasswordAndRemember fails
    func testValidLoginWithRememberToken() async throws {
        let auth = TastyTradeAuth(
            login: "kevintest",
            password: "kevin-test-password",
            rememberMe: true,
            sandbox: true
        )
        // generate a remember token
        try await auth.login()
        
        // store original tokens
        XCTAssertNotNil(auth.token)
        XCTAssertNotNil(auth.rememberToken)
        let origToken = auth.token!
        let origRemember = auth.rememberToken!
        
        // generate new token using remember
        try await auth.login()
        XCTAssertNotNil(auth.token)
        XCTAssertNotNil(auth.rememberToken)
        XCTAssertNotEqual(auth.token, origToken)
        XCTAssertNotEqual(auth.rememberToken, origRemember)
    }
}
