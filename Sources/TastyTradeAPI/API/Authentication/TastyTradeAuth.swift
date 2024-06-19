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
    var rememberToken: String?
    
    init(
        login: String,
        password: String,
        rememberMe: Bool,
        sandbox: Bool = true
    ) {
        self.login = login
        self.password = password
        self.rememberMe = rememberMe
        self.sandbox = sandbox
    }
    
    func login() async throws {
        let headers = [
            "content-type": "application/json",
            "accept": "application/json"
        ]
        let body = LoginRequest(login: login, password: password, rememberMe: rememberMe, rememberToken: rememberToken)
        
        let request = try RequestUtil.buildRequest(
            useSandbox: sandbox,
            path: ["sessions"],
            method: "POST",
            headers: headers,
            body: RequestUtil.encode(body)
        )
        
        let (statusCode, data) = try await RequestUtil.sendRequest(request)
        
        try RequestUtil.handleHttpErrors(statusCode: statusCode, data: data)
        
        let res = try RequestUtil.decode(LoginResponse.self, from: data).data
        
        if let sessionTok = res.sessionToken {
            token = sessionTok
        } else {
            throw TastyAPI.RequestError.other("No session token in api response")
        }
        if rememberMe {
            if let rememberTok = res.rememberToken {
                rememberToken = rememberTok
            } else {
                throw TastyAPI.RequestError.other("No remember token in api response")
            }
        }
    }
}
