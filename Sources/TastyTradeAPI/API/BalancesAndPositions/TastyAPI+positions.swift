//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/22/24.
//

import Foundation

extension TastyAPI {
    
    /// Retrieves a list of the account's positions
    /// - Parameters:
    ///   - accountNumber: TastyTrade account number
    ///   - underlyingSymbol: A list of underlying symbols of positions to query with
    ///   - symbol: A single symbol. Stock ticker symbol, OCC option symbol, TW Future Symbol, TW Future Option Symbol
    ///   - instrumentType: The type of instrument: Available values: Bond, Cryptocurrency, Currency Pair, Equity, Equity Offering, Equity Option, Future, Future Option, Index, Unknown, Warrant
    ///   - includeClosedPositions: If closed positions should be included in the query (default value: false)
    ///   - underlyingProductCode: The underlying Future's Product code
    ///   - partitionKeys: Account partition keys
    ///   - netPositions: Returns net positions grouped by instrument type and symbol (default value: false)
    ///   - includeMarks: Include current quote mark (note: can decrease performance)
    /// - Returns: A filtered list of the account's positions
    public static func positions(
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
