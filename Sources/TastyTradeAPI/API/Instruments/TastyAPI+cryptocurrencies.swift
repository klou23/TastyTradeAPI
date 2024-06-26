//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/25/24.
//

import Foundation

extension TastyAPI {
    
    public static func cryptocurrencies(
        symbol: [String]? = nil
    ) async throws -> [Cryptocurrency] {
        let headers = try RequestUtil.authHeader(auth: auth)
        let params: [String: Any?] = [
            "symbol": symbol
        ]
        
        let request = try RequestUtil.buildRequest(
            useSandbox: RequestUtil.sandbox(auth: auth),
            path: ["instruments", "cryptocurrencies"],
            method: "GET",
            headers: headers,
            params: params
        )
        
        let (statusCode, data) = try await RequestUtil.sendRequest(request)
        
        try RequestUtil.handleHttpErrors(statusCode: statusCode, data: data)
        
        return try RequestUtil.decode(ListResponseDTO<Cryptocurrency>.self, from: data).data.items
    }
    
    public static func cryptocurrencies(
        symbol: String
    ) async throws -> Cryptocurrency {
        let headers = try RequestUtil.authHeader(auth: auth)
        
        let request = try RequestUtil.buildRequest(
            useSandbox: RequestUtil.sandbox(auth: auth),
            path: ["instruments", "cryptocurrencies", symbol.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""],
            method: "GET",
            headers: headers
        )
        
        let (statusCode, data) = try await RequestUtil.sendRequest(request)
        
        try RequestUtil.handleHttpErrors(statusCode: statusCode, data: data)
        
        return try RequestUtil.decode(ResponseDTO<Cryptocurrency>.self, from: data).data
    }
    
}
