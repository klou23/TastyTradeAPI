//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/19/24.
//

import Foundation

extension TastyAPI {
    
    /// Retrieve a transaction by account number and ID
    ///
    /// More information about this method can be found in the
    /// [TastyTrade API Docs](https://developer.tastytrade.com/open-api-spec/transactions/#/accounts/getAccountsAccountNumberTransactionsId)
    /// 
    /// - Parameters:
    ///   - accountNumber: TastyTrade account number
    ///   - id: Transaction ID
    /// - Returns: The transaction for the given account number and ID
    public static func transaction(
        accountNumber: String,
        id: Int
    ) async throws -> Transaction {
        let headers = try RequestUtil.authHeader(auth: auth)
        
        let request = try RequestUtil.buildRequest(
            useSandbox: RequestUtil.sandbox(auth: auth),
            path: ["accounts", accountNumber.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!, "transactions", String(id)],
            method: "GET",
            headers: headers
        )
        let (statusCode, data) = try await RequestUtil.sendRequest(request)
        
        try RequestUtil.handleHttpErrors(statusCode: statusCode, data: data)
        
        return try RequestUtil.decode(ResponseDTO<Transaction>.self, from: data).data
    }
    
}
