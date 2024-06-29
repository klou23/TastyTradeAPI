//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/26/24.
//

import Foundation

extension TastyAPI {
    
    public static func futureOptionProducts() async throws -> [FutureOptionProduct] {
        let headers = try RequestUtil.authHeader(auth: auth)
        
        let request = try RequestUtil.buildRequest(
            useSandbox: RequestUtil.sandbox(auth: auth),
            path: ["instruments", "future-option-products"],
            method: "GET",
            headers: headers
        )
        
        let (statusCode, data) = try await RequestUtil.sendRequest(request)
        
        try RequestUtil.handleHttpErrors(statusCode: statusCode, data: data)
        
        return try RequestUtil.decode(ListResponseDTO<FutureOptionProduct>.self, from: data).data.items
    }
    
    public static func futureOptionProducts(
        exchange: String,
        rootSymbol: String
    ) async throws -> FutureOptionProduct {
        let headers = try RequestUtil.authHeader(auth: auth)
        
        let request = try RequestUtil.buildRequest(
            useSandbox: RequestUtil.sandbox(auth: auth),
            path: ["instruments", "future-option-products", exchange.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!, rootSymbol.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!],
            method: "GET",
            headers: headers
        )
        
        let (statusCode, data) = try await RequestUtil.sendRequest(request)
        
        try RequestUtil.handleHttpErrors(statusCode: statusCode, data: data)
        
        return try RequestUtil.decode(ResponseDTO<FutureOptionProduct>.self, from: data).data
    }
    
}
