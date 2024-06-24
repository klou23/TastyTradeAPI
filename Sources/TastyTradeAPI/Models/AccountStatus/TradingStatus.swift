//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/17/24.
//

import Foundation

public struct TradingStatus: Codable {
    public var accountNumber: String?
    public var autotradeAccountType: String?
    public var clearingAccountNumber: String?
    public var clearingAggregationIdentifier: String?
    public var dayTradeCount: Int?
    public var equitiesMarginCalculationType: String?
    public var feeScheduleName: String?
    public var futuresMarginRateMultiplier: String?
    public var id: Int?
    public var areDeepItmCarryOptionsEnabled: Bool?
    public var areFarOtmNetOptionsRestricted: Bool?
    public var areOptionsValuesRestrictedToNlv: Bool?
    public var areSingleTickExpiringHedgesIgnored: Bool?
    public var hasIntradayEquitiesMargin: Bool?
    public var isAggregatedAtClearing: Bool?
    public var isClosed: Bool?
    public var isClosingOnly: Bool?
    public var isCryptocurrencyClosingOnly: Bool?
    public var isCryptocurrencyEnabled: Bool?
    public var isEquityOfferingClosingOnly: Bool?
    public var isEquityOfferingEnabled: Bool?
    public var isFrozen: Bool?
    public var isFullEquityMarginRequired: Bool?
    public var isFuturesClosingOnly: Bool?
    public var isFuturesEnabled: Bool?
    public var isFuturesIntraDayEnabled: Bool?
    public var isInDayTradeEquityMaintenanceCall: Bool?
    public var isInMarginCall: Bool?
    public var isPatternDayTrader: Bool?
    public var isPortfolioMarginEnabled: Bool?
    public var isRiskReducingOnly: Bool?
    public var isRollTheDayForwardEnabled: Bool?
    public var isSmallNotionalFuturesIntraDayEnabled: Bool?
    public var shortCallsEnabled: Bool?
    public var optionsLevel: String?
    public var pdtResetOn: String?
    public var smallNotionalFuturesMarginRateMultiplier: String?
    public var cmtaOverride: Int?
    public var enhancedFraudSafeguardsEnabledAt: String?
    public var updatedAt: String?
    public var extCrmId: String?
    
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
