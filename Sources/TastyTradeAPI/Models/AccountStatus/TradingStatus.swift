//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/17/24.
//

import Foundation

struct TradingStatus: Codable {
    var accountNumber: String?
    var autotradeAccountType: String?
    var clearingAccountNumber: String?
    var clearingAggregationIdentifier: String?
    var dayTradeCount: Int?
    var equitiesMarginCalculationType: String?
    var feeScheduleName: String?
    var futuresMarginRateMultiplier: Double?
    var id: Int?
    var areDeepItmCarryOptionsEnabled: Bool?
    var areFarOtmNetOptionsRestricted: Bool?
    var areOptionsValuesRestrictedToNlv: Bool?
    var areSingleTickExpiringHedgesIgnored: Bool?
    var hasIntradayEquitiesMargin: Bool?
    var isAggregatedAtClearing: Bool?
    var isClosed: Bool?
    var isClosingOnly: Bool?
    var isCryptocurrencyClosingOnly: Bool?
    var isCryptocurrencyEnabled: Bool?
    var isEquityOfferingClosingOnly: Bool?
    var isEquityOfferingEnabled: Bool?
    var isFrozen: Bool?
    var isFullEquityMarginRequired: Bool?
    var isFuturesClosingOnly: Bool?
    var isFuturesEnabled: Bool?
    var isFuturesIntraDayEnabled: Bool?
    var isInDayTradeEquityMaintenanceCall: Bool?
    var isInMarginCall: Bool?
    var isPatternDayTrader: Bool?
    var isPortfolioMarginEnabled: Bool?
    var isRiskReducingOnly: Bool?
    var isRollTheDayForwardEnabled: Bool?
    var isSmallNotionalFuturesIntraDayEnabled: Bool?
    var shortCallsEnabled: Bool?
    var optionsLevel: String?
    var pdtResetOn: String?
    var smallNotionalFuturesMarginRateMultiplier: Double?
    var cmtaOverride: Int?
    var enhancedFraudSafeguardsEnabledAt: String?
    var updatedAt: String?
    var extCrmId: String?
    
    private enum CodingKeys: String, CodingKey {
        case accountNumber = "account-number"
        case autotradeAccountType = "autotrade-account-type"
        case clearingAccountNumber = "clearing-account-number"
        case clearingAggregationIdentifier = "clearing-aggregation-identifier"
        case dayTradeCount = "day-trade-count"
        case equitiesMarginCalculationType = "equities-margin-calculation-type"
        case feeScheduleName = "fee-schedule-name"
        case futuresMarginRateMultiplier = "futures-margin-rate-multiplier"
        case id
        case areDeepItmCarryOptionsEnabled = "are-deep-itm-carry-options-enabled"
        case areFarOtmNetOptionsRestricted = "are-far-otm-net-options-restricted"
        case areOptionsValuesRestrictedToNlv = "are-options-values-restricted-to-nlv"
        case areSingleTickExpiringHedgesIgnored = "are-single-tick-expiring-hedges-ignored"
        case hasIntradayEquitiesMargin = "has-intraday-equities-margin"
        case isAggregatedAtClearing = "is-aggregated-at-clearing"
        case isClosed = "is-closed"
        case isClosingOnly = "is-closing-only"
        case isCryptocurrencyClosingOnly = "is-cryptocurrency-closing-only"
        case isCryptocurrencyEnabled = "is-cryptocurrency-enabled"
        case isEquityOfferingClosingOnly = "is-equity-offering-closing-only"
        case isEquityOfferingEnabled = "is-equity-offering-enabled"
        case isFrozen = "is-frozen"
        case isFullEquityMarginRequired = "is-full-equity-margin-required"
        case isFuturesClosingOnly = "is-futures-closing-only"
        case isFuturesEnabled = "is-futures-enabled"
        case isFuturesIntraDayEnabled = "is-futures-intra-day-enabled"
        case isInDayTradeEquityMaintenanceCall = "is-in-day-trade-equity-maintenance-call"
        case isInMarginCall = "is-in-margin-call"
        case isPatternDayTrader = "is-pattern-day-trader"
        case isPortfolioMarginEnabled = "is-portfolio-margin-enabled"
        case isRiskReducingOnly = "is-risk-reducing-only"
        case isRollTheDayForwardEnabled = "is-roll-the-day-forward-enabled"
        case isSmallNotionalFuturesIntraDayEnabled = "is-small-notional-futures-intra-day-enabled"
        case shortCallsEnabled = "short-calls-enabled"
        case optionsLevel = "options-level"
        case pdtResetOn = "pdt-reset-on"
        case smallNotionalFuturesMarginRateMultiplier = "small-notional-futures-margin-rate-multiplier"
        case cmtaOverride = "cmta-override"
        case enhancedFraudSafeguardsEnabledAt = "enhanced-fraud-safeguards-enabled-at"
        case updatedAt = "updated-at"
        case extCrmId = "ext-crm-id"
    }
}
