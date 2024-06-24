//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/18/24.
//

import Foundation

extension TastyAPI {
    
    public static func tradingStatus(accountNumber: String) async throws -> TradingStatus {
        let headers = try RequestUtil.authHeader(auth: auth)
        
        let request = try RequestUtil.buildRequest(
            useSandbox: RequestUtil.sandbox(auth: auth),
            path: ["accounts", accountNumber, "trading-status"],
            method: "GET",
            headers: headers
        )
        let (statusCode, data) = try await RequestUtil.sendRequest(request)
        
        try RequestUtil.handleHttpErrors(statusCode: statusCode, data: data)
        
        return try RequestUtil.decode(ResponseDTO<TradingStatus>.self, from: data).data
        
    }
    
}
