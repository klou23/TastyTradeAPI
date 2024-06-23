//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/21/24.
//

import Foundation

extension TastyAPI {
    
    static func totalFees(
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
