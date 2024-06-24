//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/22/24.
//

import Foundation

extension TastyAPI {
    
    public static func balanceSnapshots(
        accountNumber: String,
        timeOfDay: String,
        perPage: Int? = nil,
        pageOffset: Int? = nil,
        currency: String? = nil,
        snapshotDate: String? = nil,
        startDate: String? = nil,
        endDate: String? = nil
    ) async throws -> ([AccountBalanceSnapshot], Pagination) {
        
        let headers = try RequestUtil.authHeader(auth: auth)
        
        let params: [String: Any?] = [
            "per-page": perPage,
            "page-offset": pageOffset,
            "currency": currency,
            "snapshot-date": snapshotDate,
            "time-of-day": timeOfDay,
            "start-date": startDate,
            "end-date": endDate
        ]
        
        let request = try RequestUtil.buildRequest(
            useSandbox: RequestUtil.sandbox(auth: auth),
            path: ["accounts", accountNumber, "balance-snapshots"],
            method: "GET",
            headers: headers,
            params: params
        )
        
        let (statusCode, data) = try await RequestUtil.sendRequest(request)
        
        try RequestUtil.handleHttpErrors(statusCode: statusCode, data: data)
        
        let dto = try RequestUtil.decode(PaginatedResponseDTO<AccountBalanceSnapshot>.self, from: data)
        
        return (dto.data.items, dto.pagination)
        
    }
    
}
