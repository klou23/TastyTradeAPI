//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/26/24.
//

import Foundation

extension TastyAPI {
    
    public static func equityOptions(
        symbol: [String]? = nil,
        active: Bool? = nil,
        withExpired: Bool? = nil
    ) async throws -> [EquityOption] {
        let headers = try RequestUtil.authHeader(auth: auth)
        let params: [String: Any?] = [
            "symbol": symbol,
            "active": active,
            "withExpired": withExpired
        ]
        
        let request = try RequestUtil.buildRequest(
            useSandbox: RequestUtil.sandbox(auth: auth),
            path: ["instruments", "equity-options"],
            method: "GET",
            headers: headers,
            params: params
        )
        
        let (statusCode, data) = try await RequestUtil.sendRequest(request)
        
        try RequestUtil.handleHttpErrors(statusCode: statusCode, data: data)
        
        return try RequestUtil.decode(ListResponseDTO<EquityOption>.self, from: data).data.items
    }
    
    public static func equityOptions(
        symbol: String,
        active: Bool? = nil
    ) async throws -> EquityOption {
        let headers = try RequestUtil.authHeader(auth: auth)
        
        let params: [String: Any?] = [
            "active": active,
        ]
        
        let request = try RequestUtil.buildRequest(
            useSandbox: RequestUtil.sandbox(auth: auth),
            path: ["instruments", "equity-options", symbol.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!],
            method: "GET",
            headers: headers,
            params: params
        )
        
        let (statusCode, data) = try await RequestUtil.sendRequest(request)
        
        try RequestUtil.handleHttpErrors(statusCode: statusCode, data: data)
        
        return try RequestUtil.decode(ResponseDTO<EquityOption>.self, from: data).data
    }
    
}
