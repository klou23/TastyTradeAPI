//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/21/24.
//

import Foundation

extension TastyAPI {
    
    
    /// Retrieves the total fees for an account for a given day
    ///
    /// More information about this method can be found in the
    /// [TastyTrade API Docs](https://developer.tastytrade.com/open-api-spec/transactions/#/accounts/getAccountsAccountNumberTransactionsTotalFees)
    ///
    /// - Parameters:
    ///   - accountNumber: TastyTrade account number
    ///   - date: The date to get fees for, defaults to today
    /// - Returns: The total fees for an account for a given day
    public static func totalFees(
        accountNumber: String,
        date: String? = nil
    ) async throws -> TotalFees {
        let headers = try RequestUtil.authHeader(auth: auth)
        let params: [String: Any?] = [
            "date": date
        ]
        
        let request = try RequestUtil.buildRequest(
            useSandbox: RequestUtil.sandbox(auth: auth),
            path: ["accounts", accountNumber, "transactions", "total-fees"],
            method: "GET",
            headers: headers,
            params: params
        )
        
        let (statusCode, data) = try await RequestUtil.sendRequest(request)
        
        try RequestUtil.handleHttpErrors(statusCode: statusCode, data: data)
        
        return try RequestUtil.decode(ResponseDTO<TotalFees>.self, from: data).data
    }
    
}
