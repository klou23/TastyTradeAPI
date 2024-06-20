//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/19/24.
//

import XCTest
@testable import TastyTradeAPI

struct TestAuthUtils {
    
    private init() { }
    
    static func setupValidAuth(
        remember: Bool = true,
        file: StaticString = #filePath,
        line: UInt = #line
    ) async throws {
        let auth = TastyTradeAuth(
            login: "kevintest",
            password: "kevin-test-password",
            rememberMe: remember,
            sandbox: true
        )
        
        do {
            try await auth.login()
        } catch {
            XCTFail("Login failed", file: file, line: line)
        }
        
        XCTAssertNotNil(auth.token, file: file, line: line)
        
        if remember {
            XCTAssertNotNil(auth.rememberToken, file: file, line: line)
        }
        
        TastyAPI.auth = auth
    }
    
    static func setupInvalidAuth(
        file: StaticString = #filePath,
        line: UInt = #line
    ) async throws {
        let auth = TastyTradeAuth(
            login: "kevintest",
            password: "invalid-password",
            rememberMe: true,
            sandbox: true
        )
        
        do {
            try await auth.login()
            XCTFail("Login should fail with invalid credentials")
        } catch TastyAPI.ApiError.http401(code: _, message: _) {
            //should fall into this catch block
        } catch {
            XCTFail("Login should throw TastyAPI.ApiError.http401")
        }
        
        TastyAPI.auth = auth
    }
    
}
