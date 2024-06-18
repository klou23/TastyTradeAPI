//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/16/24.
//

import Foundation

class TastyTradeAuth {
    
    var login: String
    var password: String
    var rememberMe: Bool
    var sandbox: Bool
    
    var token: String?
    var refreshToken: String?
    
    init(
        login: String,
        password: String,
        rememberMe: Bool,
        sandbox: Bool = false
    ) {
        self.login = login
        self.password = password
        self.rememberMe = rememberMe
        self.sandbox = sandbox
    }
    
    func login() async throws {
        let headers = [
            "content-type": "application/json"
        ]
        let body = LoginRequest(login: login, password: password, rememberMe: rememberMe)
        
        let (statusCode, data) = try await RequestUtil.post(
            useSandbox: sandbox,
            path: ["sessions"],
            headers: headers,
            body: JSONEncoder().encode(body))
        
        if statusCode >= 200 && statusCode < 300 {
            let respData = try JSONDecoder().decode(LoginResponse.self, from: data).data
            if let sessionTok = respData.sessionToken {
                token = sessionTok
            } else {
                throw AuthError.other("No session token in api response")
            }
            if rememberMe {
                if let rememberTok = respData.rememberToken {
                    refreshToken = rememberTok
                } else {
                    throw AuthError.other("No remember token in api response")
                }
            }
        } else {
            // error
            let error = try JSONDecoder().decode(ErrorResponse.self, from: data).error
            if error.code == "invalid_credentials" {
                throw AuthError.invalidCredentials(error.message)
            }
            throw AuthError.other("\(error.code): \(error.message)")
        }
    }
    
}
