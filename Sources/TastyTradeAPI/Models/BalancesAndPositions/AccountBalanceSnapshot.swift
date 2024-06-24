//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/22/24.
//

import Foundation

/// Data model for storing a snapshot of the current account balance
///
/// This type is returned from ``TastyAPI/balanceSnapshots(accountNumber:timeOfDay:perPage:pageOffset:currency:snapshotDate:startDate:endDate:)``.
///
///  More info can be found in the [TastyTrade API Docs](https://developer.tastytrade.com/open-api-spec/balances-and-positions/#/).
public struct AccountBalanceSnapshot: Codable {
    public var accountNumber: String?
    public var currency: String?
    public var cashBalance: String?
    public var longEquityValue: String?
    public var shortEquityValue: String?
    public var longDerivativeValue: String?
    public var shortDerivativeValue: String?
    public var longFuturesValue: String?
    public var shortFuturesValue: String?
    public var longFuturesDerivativeValue: String?
    public var shortFuturesDerivativeValue: String?
    public var longMargineableValue: String?
    public var shortMargineableValue: String?
    public var marginEquity: String?
    public var equityBuyingPower: String?
    public var derivativeBuyingPower: String?
    public var dayTradingBuyingPower: String?
    public var futuresMarginRequirement: String?
    public var availableTradingFunds: String?
    public var maintenanceRequirement: String?
    public var maintenanceCallValue: String?
    public var regTCallValue: String?
    public var dayTradingCallValue: String?
    public var dayEquityCallValue: String?
    public var netLiquidatingValue: String?
    public var cashAvailableToWithdraw: String?
    public var dayTradeExcess: String?
    public var pendingCash: String?
    public var pendingCashEffect: String?
    public var longCryptocurrencyValue: String?
    public var shortCryptocurrencyValue: String?
    public var cryptocurrencyMarginRequirement: String?
    public var unsettledCryptocurrencyFiatAmount: String?
    public var unsettledCryptocurrencyFiatEffect: String?
    public var closedLoopAvailableBalance: String?
    public var equityOfferingMarginRequirement: String?
    public var longBondValue: String?
    public var bondMarginRequirement: String?
    public var usedDerivativeBuyingPower: String?
    public var specialMemorandumAccountValue: String?
    public var specialMemorandumAccountApexAdjustment: String?
    public var totalSettleBalance: String?
    public var marginSettleBalance: String?
    public var cashSettleBalance: String?
    public var smaEquityOptionBuyingPower: String?
    public var snapshotDate: String?
    public var timeOfDay: String?

    private enum CodingKeys: String, CodingKey {
        case accountNumber = "account-number"
        case currency
        case cashBalance = "cash-balance"
        case longEquityValue = "long-equity-value"
        case shortEquityValue = "short-equity-value"
        case longDerivativeValue = "long-derivative-value"
        case shortDerivativeValue = "short-derivative-value"
        case longFuturesValue = "long-futures-value"
        case shortFuturesValue = "short-futures-value"
        case longFuturesDerivativeValue = "long-futures-derivative-value"
        case shortFuturesDerivativeValue = "short-futures-derivative-value"
        case longMargineableValue = "long-margineable-value"
        case shortMargineableValue = "short-margineable-value"
        case marginEquity = "margin-equity"
        case equityBuyingPower = "equity-buying-power"
        case derivativeBuyingPower = "derivative-buying-power"
        case dayTradingBuyingPower = "day-trading-buying-power"
        case futuresMarginRequirement = "futures-margin-requirement"
        case availableTradingFunds = "available-trading-funds"
        case maintenanceRequirement = "maintenance-requirement"
        case maintenanceCallValue = "maintenance-call-value"
        case regTCallValue = "reg-t-call-value"
        case dayTradingCallValue = "day-trading-call-value"
        case dayEquityCallValue = "day-equity-call-value"
        case netLiquidatingValue = "net-liquidating-value"
        case cashAvailableToWithdraw = "cash-available-to-withdraw"
        case dayTradeExcess = "day-trade-excess"
        case pendingCash = "pending-cash"
        case pendingCashEffect = "pending-cash-effect"
        case longCryptocurrencyValue = "long-cryptocurrency-value"
        case shortCryptocurrencyValue = "short-cryptocurrency-value"
        case cryptocurrencyMarginRequirement = "cryptocurrency-margin-requirement"
        case unsettledCryptocurrencyFiatAmount = "unsettled-cryptocurrency-fiat-amount"
        case unsettledCryptocurrencyFiatEffect = "unsettled-cryptocurrency-fiat-effect"
        case closedLoopAvailableBalance = "closed-loop-available-balance"
        case equityOfferingMarginRequirement = "equity-offering-margin-requirement"
        case longBondValue = "long-bond-value"
        case bondMarginRequirement = "bond-margin-requirement"
        case usedDerivativeBuyingPower = "used-derivative-buying-power"
        case specialMemorandumAccountValue = "special-memorandum-account-value"
        case specialMemorandumAccountApexAdjustment = "special-memorandum-account-apex-adjustment"
        case totalSettleBalance = "total-settle-balance"
        case marginSettleBalance = "margin-settle-balance"
        case cashSettleBalance = "cash-settle-balance"
        case smaEquityOptionBuyingPower = "sma-equity-option-buying-power"
        case snapshotDate = "snapshot-date"
        case timeOfDay = "time-of-day"
    }
}
