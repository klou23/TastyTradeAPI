//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/26/24.
//

import Foundation

public struct FutureOptionProduct: Codable {
    public var rootSymbol: String?
    public var cashSettled: Bool?
    public var code: String?
    public var legacyCode: String?
    public var clearportCode: String?
    public var clearingCode: String?
    public var clearingExchangeCode: String?
    public var clearingPriceMultiplier: String?
    public var displayFactor: String?
    public var exchange: String?
    public var productType: String?
    public var expirationType: String?
    public var settlementDelayDays: Int?
    public var isRollover: Bool?
    public var productSubtype: String?
    public var marketSector: String?
    public var supported: Bool?
    public var futureProduct: FutureProduct

    private enum CodingKeys: String, CodingKey {
        case rootSymbol = "root-symbol"
        case cashSettled = "cash-settled"
        case code
        case legacyCode = "legacy-code"
        case clearportCode = "clearport-code"
        case clearingCode = "clearing-code"
        case clearingExchangeCode = "clearing-exchange-code"
        case clearingPriceMultiplier = "clearing-price-multiplier"
        case displayFactor = "display-factor"
        case exchange
        case productType = "product-type"
        case expirationType = "expiration-type"
        case settlementDelayDays = "settlement-delay-days"
        case isRollover = "is-rollover"
        case productSubtype = "product-subtype"
        case marketSector = "market-sector"
        case supported
        case futureProduct = "future-product"
    }
}
