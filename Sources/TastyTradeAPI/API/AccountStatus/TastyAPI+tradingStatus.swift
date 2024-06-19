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
            throw RequestError.noAuth
        }
        guard let useSandbox = auth?.sandbox else {
            throw RequestError.noAuth
        }
        let headers = [
            "Authorization": sessionTok
        ]
        let (statusCode, data) = try await RequestUtil.get(
            useSandbox: useSandbox,
            path: ["accounts", accountNumber, "trading-status"],
            headers: headers,
            params: [:]
        )
        
        if statusCode == 404 {
            throw RequestError.notFound
        } else if statusCode >= 200 && statusCode < 300 {
            let respData = try JSONDecoder().decode(TradingStatusResponse.self, from: data).data
            return respData
        } else {
            let error = try JSONDecoder().decode(ErrorResponse.self, from: data).error
            if error.code == "token_invalid" {
                throw RequestError.noAuth
            }
            throw RequestError.other("\(error.code): \(error.message)")
        }
    }
    
}
