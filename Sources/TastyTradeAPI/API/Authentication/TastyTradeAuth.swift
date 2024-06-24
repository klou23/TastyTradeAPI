//
//  File.swift
//
//
//  Created by Kevin Lou on 6/16/24.
//

import Foundation

/// Authentication model that handles api tokens
public class TastyTradeAuth {
    
    var login: String
    var password: String
    var rememberMe: Bool
    var sandbox: Bool
    
    var token: String?
    var rememberToken: String?
    
    public init(
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
    
    /// Attempts to authenticate with the TastyTrade servers.
    ///
    /// If there is a rememberToken, then this method will use the rememberToken, otherwise the password
    /// will be used.
    public func login() async throws {
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
        
        let res = try RequestUtil.decode(ResponseDTO<LoginResponseData>.self, from: data).data
        
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
