//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/21/24.
//

import Foundation

/// Data model for storing the total fees for an account for a given day
///
/// The type is returned from ``TastyAPI/totalFees(accountNumber:date:)``.
///
/// More info can be found in the [TastyTrade API Docs](https://developer.tastytrade.com/open-api-spec/transactions/#/).
public struct TotalFees: Codable {
    public var totalFees: String?
    public var totalFeesEffect: String?
    
    private enum CodingKeys: String, CodingKey {
        case totalFees = "total-fees"
        case totalFeesEffect = "total-fees-effect"
    }
}
