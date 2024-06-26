//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/26/24.
//

import Foundation

extension TastyAPI {
    
    public static func activeEquities(
        perPage: Int? = nil,
        pageOffset: Int? = nil,
        lendability: String? = nil
    ) async throws -> ([Equity], Pagination) {
        let headers = try RequestUtil.authHeader(auth: auth)
        let params: [String: Any?] = [
            "per-page": perPage,
            "page-offset": pageOffset,
            "lendability": lendability
        ]
        
        let request = try RequestUtil.buildRequest(
            useSandbox: RequestUtil.sandbox(auth: auth),
            path: ["instruments", "equities", "active"],
            method: "GET",
            headers: headers,
            params: params
        )
        
        let (statusCode, data) = try await RequestUtil.sendRequest(request)
        
        try RequestUtil.handleHttpErrors(statusCode: statusCode, data: data)
        
        let res = try RequestUtil.decode(PaginatedResponseDTO<Equity>.self, from: data)
        
        return (res.data.items, res.pagination)
    }
    
    public static func equities(
        symbol: [String]? = nil,
        lendability: String? = nil,
        isIndex: Bool? = nil,
        isEtf: Bool? = nil
    ) async throws -> [Equity] {
        let headers = try RequestUtil.authHeader(auth: auth)
        let params: [String: Any?] = [
            "symbol": symbol,
            "lendability": lendability,
            "is-index": isIndex,
            "is-etf": isEtf
        ]
        
        let request = try RequestUtil.buildRequest(
            useSandbox: RequestUtil.sandbox(auth: auth),
            path: ["instruments", "equities"],
            method: "GET",
            headers: headers,
            params: params
        )
        
        let (statusCode, data) = try await RequestUtil.sendRequest(request)
        
        try RequestUtil.handleHttpErrors(statusCode: statusCode, data: data)
        
        return try RequestUtil.decode(ListResponseDTO<Equity>.self, from: data).data.items
    }
    
    public static func equities(
        symbol: String
    ) async throws -> Equity {
        let headers = try RequestUtil.authHeader(auth: auth)
        
        let request = try RequestUtil.buildRequest(
            useSandbox: RequestUtil.sandbox(auth: auth),
            path: ["instruments", "equities", symbol.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!],
            method: "GET",
            headers: headers
        )
        
        let (statusCode, data) = try await RequestUtil.sendRequest(request)
        
        try RequestUtil.handleHttpErrors(statusCode: statusCode, data: data)
        
        return try RequestUtil.decode(ResponseDTO<Equity>.self, from: data).data
    }
    
}
