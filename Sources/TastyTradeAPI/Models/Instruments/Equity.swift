//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/26/24.
//

import Foundation

public struct Equity: Codable {
    var symbol: String?
    var instrumentType: String?
    var shortDescription: String?
    var isIndex: Bool?
    var listedMarket: String?
    var description: String?
    var lendability: String?
    var borrowRate: String?
    var haltedAt: String?
    var stopsTradingAt: String?
    var marketTimeInstrumentCollection: String?
    var isClosingOnly: Bool?
    var isOptionsClosingOnly: Bool?
    var active: Bool?
    var isFractionalQuantityEligible: Bool?
    var isIlliquid: Bool?
    var isEtf: Bool?
    var streamerSymbol: String?
    var countryOfTaxation: String?
    var countryOfIncorporation: String?
    var bypassManualReview: Bool?
    var tickSizes: [TickSize]?
    var optionTickSizes: [TickSize]?

    private enum CodingKeys: String, CodingKey {
        case symbol
        case instrumentType = "instrument-type"
        case shortDescription = "short-description"
        case isIndex = "is-index"
        case listedMarket = "listed-market"
        case description
        case lendability
        case borrowRate = "borrow-rate"
        case haltedAt = "halted-at"
        case stopsTradingAt = "stops-trading-at"
        case marketTimeInstrumentCollection = "market-time-instrument-collection"
        case isClosingOnly = "is-closing-only"
        case isOptionsClosingOnly = "is-options-closing-only"
        case active
        case isFractionalQuantityEligible = "is-fractional-quantity-eligible"
        case isIlliquid = "is-illiquid"
        case isEtf = "is-etf"
        case streamerSymbol = "streamer-symbol"
        case countryOfTaxation = "country-of-taxation"
        case countryOfIncorporation = "country-of-incorporation"
        case bypassManualReview = "bypass-manual-review"
        case tickSizes = "tick-sizes"
        case optionTickSizes = "option-tick-sizes"
    }
}
