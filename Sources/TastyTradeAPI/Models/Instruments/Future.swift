//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/26/24.
//

import Foundation

public struct Future: Codable {
    var symbol: String?
    var productCode: String?
    var contractSize: String?
    var tickSize: String?
    var notionalMultiplier: String?
    var mainFraction: String?
    var subFraction: String?
    var displayFactor: String?
    var lastTradeDate: String?
    var expirationDate: String?
    var closingOnlyDate: String?
    var active: Bool?
    var activeMonth: Bool?
    var nextActiveMonth: Bool?
    var isClosingOnly: Bool?
    var firstNoticeDate: String?
    var stopsTradingAt: String?
    var expiresAt: String?
    var productGroup: String?
    var exchange: String?
    var rollTargetSymbol: String?
    var streamerExchangeCode: String?
    var streamerSymbol: String?
    var backMonthFirstCalendarSymbol: Bool?
    var isTradeable: Bool?
    var trueUnderlyingSymbol: String?
    var exchangeData: ExchangeData?
    var futureEtfEquivalent: FutureEtfEquivalent?
    var futureProduct: FutureProduct?
    var tickSizes: [TickSize]?
    var optionTickSizes: [TickSize]?
    var spreadTickSizes: [TickSize]?

    private enum CodingKeys: String, CodingKey {
        case symbol
        case productCode = "product-code"
        case contractSize = "contract-size"
        case tickSize = "tick-size"
        case notionalMultiplier = "notional-multiplier"
        case mainFraction = "main-fraction"
        case subFraction = "sub-fraction"
        case displayFactor = "display-factor"
        case lastTradeDate = "last-trade-date"
        case expirationDate = "expiration-date"
        case closingOnlyDate = "closing-only-date"
        case active
        case activeMonth = "active-month"
        case nextActiveMonth = "next-active-month"
        case isClosingOnly = "is-closing-only"
        case firstNoticeDate = "first-notice-date"
        case stopsTradingAt = "stops-trading-at"
        case expiresAt = "expires-at"
        case productGroup = "product-group"
        case exchange
        case rollTargetSymbol = "roll-target-symbol"
        case streamerExchangeCode = "streamer-exchange-code"
        case streamerSymbol = "streamer-symbol"
        case backMonthFirstCalendarSymbol = "back-month-first-calendar-symbol"
        case isTradeable = "is-tradeable"
        case trueUnderlyingSymbol = "true-underlying-symbol"
        case exchangeData = "exchange-data"
        case futureEtfEquivalent = "future-etf-equivalent"
        case futureProduct = "future-product"
        case tickSizes = "tick-sizes"
        case optionTickSizes = "option-tick-sizes"
        case spreadTickSizes = "spread-tick-sizes"
    }
}
