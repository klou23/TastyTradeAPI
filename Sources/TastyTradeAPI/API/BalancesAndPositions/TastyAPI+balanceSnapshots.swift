//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/22/24.
//

import Foundation

extension TastyAPI {
    
    /// Retrieves most recent snapshot and current balance for an account
    /// 
    /// More information about this method can be found in the
    /// [TastyTrade API Docs](https://developer.tastytrade.com/open-api-spec/balances-and-positions/#/balance-snapshots/getAccountsAccountNumberBalanceSnapshots)
    ///
    /// - Parameters:
    ///   - accountNumber: TastyTrade account number
    ///   - timeOfDay: The abbreviation for the time of day. Available values: EOD, BOD
    ///   - perPage: Results per page (default value: 250)
    ///   - pageOffset: Pages to offset results by (default value: 0)
    ///   - currency: Currency (default value: USD)
    ///   - snapshotDate: The day of the balance snapshot to retrieve
    ///   - startDate: The first date in a range of dates to retrieve
    ///   - endDate: The last date in a range of dates to retrieve
    /// - Returns: A list of snapshots and balances for an account along with pagination info
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
            path: ["accounts", accountNumber.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "", "balance-snapshots"],
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
