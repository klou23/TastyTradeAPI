//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/21/24.
//

import Foundation

extension TastyAPI {
    
    /// Retrieves a list of the account's transactions
    ///
    /// [TastyTrade API Docs](https://developer.tastytrade.com/open-api-spec/transactions/#/transactions/getAccountsAccountNumberTransactions)
    ///
    /// - Parameters:
    ///   - accountNumber: TastyTrade account number
    ///   - perPage: Results per page (default value: 250)
    ///   - pageOffset: Pages to offset results by (default value: 0)
    ///   - currency: Currency (default value: USD)
    ///   - sort: The order to sort results in. Accepts: Desc or Asc (default value: Desc)
    ///   - type: Filter based on transaction type
    ///   - types: Allows filtering on multiple transaction types
    ///   - subType: Filter based on transaction sub type
    ///   - startDate: The start date of transactions to query
    ///   - endDate: The end date of transactions to query. Defaults to now
    ///   - instrumentType: The type of instrument. Accepts: Bond, Cryptocurrency, Currency Pair, Equity, Equity Offering, Equity Option, Future, Future Option, Index, Unknown, Warrant
    ///   - symbol: The stock ticker symbol, OCC option symbol, TW future symbol, or TW future option symbol
    ///   - underlyingSymbol: The underlying symbol. The ticker symbol or TW future symbol without date component or the full TW future symbol
    ///   - action: The action of the transaction. Accepts: Sell to Open, Sell to Close, Buy to Open, Buy to Close, Sell, Buy, or Allocate
    ///   - partitionKey: Account partition key
    ///   - futuresSymbol: The full TW future symbol
    ///   - startAt: DateTime start range for filtering transactions in full date-time
    ///   - endAt: DateTime end range for filtering transactions in full date-time
    /// - Returns: A list of the account's transactions along with pagination info
    public static func transactions(
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
