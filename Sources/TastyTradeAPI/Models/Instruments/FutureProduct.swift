//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/26/24.
//

import Foundation

public struct FutureProduct: Codable {
    var rootSymbol: String?
    var code: String?
    var description: String?
    var exchange: String?
    var productType: String?
    var listedMonths: [String]?
    var activeMonths: [String]?
    var notionalMultiplier: String?
    var tickSize: String?
    var displayFactor: String?
    var baseTick: Int?
    var subTick: Int?
    var streamerExchangeCode: String?
    var smallNotional: Bool?
    var backMonthFirstCalendarSymbol: Bool?
    var firstNotice: Bool?
    var cashSettled: Bool?
    var contractLimit: Int?
    var securityGroup: String?
    var productSubtype: String?
    var trueUnderlyingCode: String?
    var marketSector: String?
    var priceFormat: String?
    var supported: Bool?
    var underlyingDescription: String?
    var underlyingIdentifier: String?
    var roll: Roll?

    private enum CodingKeys: String, CodingKey {
        case rootSymbol = "root-symbol"
        case code
        case description
        case exchange
        case productType = "product-type"
        case listedMonths = "listed-months"
        case activeMonths = "active-months"
        case notionalMultiplier = "notional-multiplier"
        case tickSize = "tick-size"
        case displayFactor = "display-factor"
        case baseTick = "base-tick"
        case subTick = "sub-tick"
        case streamerExchangeCode = "streamer-exchange-code"
        case smallNotional = "small-notional"
        case backMonthFirstCalendarSymbol = "back-month-first-calendar-symbol"
        case firstNotice = "first-notice"
        case cashSettled = "cash-settled"
        case contractLimit = "contract-limit"
        case securityGroup = "security-group"
        case productSubtype = "product-subtype"
        case trueUnderlyingCode = "true-underlying-code"
        case marketSector = "market-sector"
        case priceFormat = "price-format"
        case supported
        case underlyingDescription = "underlying-description"
        case underlyingIdentifier = "underlying-identifier"
        case roll
    }
}
