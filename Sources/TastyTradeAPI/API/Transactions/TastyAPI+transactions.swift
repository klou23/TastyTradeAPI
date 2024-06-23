//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/21/24.
//

import Foundation

extension TastyAPI {
    
    static func transactions(
        accountNumber: String,
        perPage: Int? = nil,
        pageOffset: Int? = nil,
        currency: String? = nil,
        sort: String? = nil,
        type: String? = nil,
        types: [String]? = nil,
        subType: [String]? = nil,
        startDate: String? = nil,
        endDate: String?  = nil,
        instrumentType: String? = nil,
        symbol: String? = nil,
        underlyingSymbol: String? = nil,
        action: String? = nil,
        partitionKey: String? = nil,
        futuresSymbol: String? = nil,
        startAt: String? = nil,
        endAt: String? = nil
    ) async throws -> ([Transaction], Pagination) {
        
        let headers = try RequestUtil.authHeader(auth: auth)
        
        let params: [String: Any?] = [
            "per-page": perPage,
            "page-offset": pageOffset,
            "currency": currency,
            "sort": sort,
            "type": type,
            "types": types,
            "sub-type": subType,
            "start-date": startDate,
            "end-date": endDate,
            "instrument-type": instrumentType,
            "symbol": symbol,
            "underlying-symbol": underlyingSymbol,
            "action": action,
            "partition-key": partitionKey,
            "futures-symbol": futuresSymbol,
            "start-at": startAt,
            "end-at": endAt
        ]
        
        let request = try RequestUtil.buildRequest(
            useSandbox: RequestUtil.sandbox(auth: auth),
            path: ["accounts", accountNumber, "transactions"],
            method: "GET",
            headers: headers,
            params: params
        )
        
        let (statusCode, data) = try await RequestUtil.sendRequest(request)
        
        try RequestUtil.handleHttpErrors(statusCode: statusCode, data: data)
        
        let dto = try RequestUtil.decode(PaginatedResponseDTO<Transaction>.self, from: data)
        
        return (dto.data.items, dto.pagination)
    }
    
}
