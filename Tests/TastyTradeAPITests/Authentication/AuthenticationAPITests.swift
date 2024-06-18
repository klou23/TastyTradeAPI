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
        XCTAssertNotNil(auth.refreshToken)
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
        XCTAssertNil(auth.refreshToken)
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
        } catch AuthError.invalidCredentials(let message) {
            // should fall into this catch block
        } catch {
            XCTFail("Incorrect error thrown")
        }
    }
}
