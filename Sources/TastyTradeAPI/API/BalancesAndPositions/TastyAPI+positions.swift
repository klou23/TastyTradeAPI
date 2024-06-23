//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/22/24.
//

import Foundation

extension TastyAPI {
    
    static func positions(
        accountNumber: String,
        underlyingSymbol: [String]? = nil,
        symbol: String? = nil,
        instrumentType: String? = nil,
        includeClosedPositions: Bool? = nil,
        underlyingProductCode: String? = nil,
        partitionKeys: [String]? = nil,
        netPositions: Bool? = nil,
        includeMarks: Bool? = nil
    ) async throws -> [CurrentPosition] {
        
        let headers = try RequestUtil.authHeader(auth: auth)
        
        let params: [String: Any?] = [
            "underlying-symbol": underlyingSymbol,
            "symbol": symbol,
            "instrument-type": instrumentType,
            "include-closed-positions": includeClosedPositions,
            "underlying-product-code": underlyingProductCode,
            "partition-keys": partitionKeys,
            "net-positions": netPositions,
            "include-marks": includeMarks
        ]
        
        let request = try RequestUtil.buildRequest(
            useSandbox: RequestUtil.sandbox(auth: auth),
            path: ["accounts", accountNumber, "positions"],
            method: "GET",
            headers: headers,
            params: params
        )
        
        let (statusCode, data) = try await RequestUtil.sendRequest(request)
        
        try RequestUtil.handleHttpErrors(statusCode: statusCode, data: data)
        
        return try RequestUtil.decode(ListResponseDTO<CurrentPosition>.self, from: data).data.items
        
    }
    
}
