//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/22/24.
//

import Foundation

extension TastyAPI {
    
    /// Retrieves the current balance values for an account
    ///
    /// More information about this method can be found in the
    /// [TastyTrade API Docs](https://developer.tastytrade.com/open-api-spec/balances-and-positions/#/accounts/getAccountsAccountNumberBalances)
    ///
    /// - Parameters:
    ///   - accountNumber: TastyTrade account number
    ///   - currency: Currency balance to get for account (default value: USD)
    /// - Returns: the current balance values for an account
    public static func balances(
        accountNumber: String,
        currency: String? = nil
    ) async throws -> AccountBalance {
        
        let headers = try RequestUtil.authHeader(auth: auth)
        
        let params: [String: Any?] = [
            "currency": currency
        ]
        
        let request = try RequestUtil.buildRequest(
            useSandbox: RequestUtil.sandbox(auth: auth),
            path: ["accounts", accountNumber.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "", "balances"],
            method: "GET",
            headers: headers,
            params: params
        )
        
        let (statusCode, data) = try await RequestUtil.sendRequest(request)
        
        try RequestUtil.handleHttpErrors(statusCode: statusCode, data: data)
        
        return try RequestUtil.decode(ResponseDTO<AccountBalance>.self, from: data).data
        
    }
    
}
