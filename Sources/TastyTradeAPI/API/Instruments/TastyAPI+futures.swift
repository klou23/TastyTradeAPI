//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/26/24.
//

import Foundation

extension TastyAPI {
    
    public static func futures(
        symbol: [String]? = nil,
        productCode: [String]? = nil
    ) async throws -> [Future] {
        let headers = try RequestUtil.authHeader(auth: auth)
        let params: [String: Any?] = [
            "symbol": symbol,
            "product-code": productCode
        ]
        
        let request = try RequestUtil.buildRequest(
            useSandbox: RequestUtil.sandbox(auth: auth),
            path: ["instruments", "futures"],
            method: "GET",
            headers: headers,
            params: params
        )
        
        let (statusCode, data) = try await RequestUtil.sendRequest(request)
        
        try RequestUtil.handleHttpErrors(statusCode: statusCode, data: data)
        
        return try RequestUtil.decode(ListResponseDTO<Future>.self, from: data).data.items
    }
    
    public static func futures(
        symbol: String
    ) async throws -> Future {
        let headers = try RequestUtil.authHeader(auth: auth)
        
        let request = try RequestUtil.buildRequest(
            useSandbox: RequestUtil.sandbox(auth: auth),
            path: ["instruments", "futures", symbol.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!],
            method: "GET",
            headers: headers
        )
        
        let (statusCode, data) = try await RequestUtil.sendRequest(request)
        
        try RequestUtil.handleHttpErrors(statusCode: statusCode, data: data)
        
        return try RequestUtil.decode(ResponseDTO<Future>.self, from: data).data
    }
    
}
