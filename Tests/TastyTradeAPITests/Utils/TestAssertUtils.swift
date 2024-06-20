//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/19/24.
//

import XCTest

struct TestAssertUtils {
    
    private init() { }
    
    private static func assertThrowsAsyncHelper<T>(
        _ expression: @autoclosure () async throws -> T,
        file: StaticString = #filePath,
        line: UInt = #line,
        _ errorHandler: (_ error: Error) -> Void = { _ in }
    ) async {
        do {
            _ = try await expression()
            XCTFail("Expected error: no error thrown", file: file, line: line)
        } catch {
            errorHandler(error)
        }
    }
    
    static func assertThrowsAsync<T: Error & Equatable, U>(
        _ expression: @autoclosure () async throws -> U,
        _ expectedError: T,
        file: StaticString = #filePath,
        line: UInt = #line
    ) async {
        await assertThrowsAsyncHelper(try await expression()) { error in
            XCTAssertEqual(error as? T, expectedError)
        }
    }
    
}
