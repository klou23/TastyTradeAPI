//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/26/24.
//

import Foundation

public struct EquityOption: Codable {
    var symbol: String?
    var instrumentType: String?
    var active: Bool?
    var listedMarket: String?
    var strikePrice: String?
    var rootSymbol: String?
    var underlyingSymbol: String?
    var expirationDate: String?
    var exerciseStyle: String?
    var sharesPerContract: Int?
    var optionType: String?
    var optionChainType: String?
    var expirationType: String?
    var settlementType: String?
    var haltedAt: String?
    var stopsTradingAt: String?
    var marketTimeInstrumentCollection: String?
    var daysToExpiration: Int?
    var expiresAt: String?
    var isClosingOnly: Bool?
    var oldSecurityNumber: String?
    var streamerSymbol: String?

    private enum CodingKeys: String, CodingKey {
        case symbol
        case instrumentType = "instrument-type"
        case active
        case listedMarket = "listed-market"
        case strikePrice = "strike-price"
        case rootSymbol = "root-symbol"
        case underlyingSymbol = "underlying-symbol"
        case expirationDate = "expiration-date"
        case exerciseStyle = "exercise-style"
        case sharesPerContract = "shares-per-contract"
        case optionType = "option-type"
        case optionChainType = "option-chain-type"
        case expirationType = "expiration-type"
        case settlementType = "settlement-type"
        case haltedAt = "halted-at"
        case stopsTradingAt = "stops-trading-at"
        case marketTimeInstrumentCollection = "market-time-instrument-collection"
        case daysToExpiration = "days-to-expiration"
        case expiresAt = "expires-at"
        case isClosingOnly = "is-closing-only"
        case oldSecurityNumber = "old-security-number"
        case streamerSymbol = "streamer-symbol"
    }
}
