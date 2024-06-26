//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/18/24.
//

import Foundation

extension TastyAPI {
    
    /// Retrieves information about the basic trade status of an account. This includes information about
    /// the strategies an account can trade.
    ///
    /// More information about this method can be found in the
    /// [TastyTrade API Docs](https://developer.tastytrade.com/open-api-spec/account-status/#/trading-status/getAccountsAccountNumberTradingStatus)
    ///
    /// - Parameter accountNumber: TastyTrade account number
    /// - Returns: current trading status for an account
    public static func tradingStatus(accountNumber: String) async throws -> TradingStatus {
        let headers = try RequestUtil.authHeader(auth: auth)
        
        let request = try RequestUtil.buildRequest(
            useSandbox: RequestUtil.sandbox(auth: auth),
            path: ["accounts", accountNumber.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "", "trading-status"],
            method: "GET",
            headers: headers
        )
        let (statusCode, data) = try await RequestUtil.sendRequest(request)
        
        try RequestUtil.handleHttpErrors(statusCode: statusCode, data: data)
        
        return try RequestUtil.decode(ResponseDTO<TradingStatus>.self, from: data).data
        
    }
    
}
