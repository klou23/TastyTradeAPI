//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/18/24.
//

import Foundation

extension TastyAPI {
    
    static func tradingStatus(accountNumber: String) async throws -> TradingStatus {
        guard let sessionTok = auth?.token else {
            throw TastyAPI.RequestError.noAuthorization
        }
        guard let useSandbox = auth?.sandbox else {
            throw TastyAPI.RequestError.noAuthorization
        }
        let headers = [
            "Authorization": sessionTok
        ]
        
        let request = try RequestUtil.buildRequest(
            useSandbox: useSandbox,
            path: ["accounts", accountNumber, "trading-status"],
            method: "GET",
            headers: headers
        )
        let (statusCode, data) = try await RequestUtil.sendRequest(request)
        
        try RequestUtil.handleHttpErrors(statusCode: statusCode, data: data)
        
        return try RequestUtil.decode(TradingStatusResponse.self, from: data).data
        
    }
    
}
