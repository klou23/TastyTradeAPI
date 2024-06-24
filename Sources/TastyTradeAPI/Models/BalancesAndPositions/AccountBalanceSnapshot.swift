//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/22/24.
//

import Foundation

public struct AccountBalanceSnapshot: Codable {
    var accountNumber: String?
    var currency: String?
    var cashBalance: String?
    var longEquityValue: String?
    var shortEquityValue: String?
    var longDerivativeValue: String?
    var shortDerivativeValue: String?
    var longFuturesValue: String?
    var shortFuturesValue: String?
    var longFuturesDerivativeValue: String?
    var shortFuturesDerivativeValue: String?
    var longMargineableValue: String?
    var shortMargineableValue: String?
    var marginEquity: String?
    var equityBuyingPower: String?
    var derivativeBuyingPower: String?
    var dayTradingBuyingPower: String?
    var futuresMarginRequirement: String?
    var availableTradingFunds: String?
    var maintenanceRequirement: String?
    var maintenanceCallValue: String?
    var regTCallValue: String?
    var dayTradingCallValue: String?
    var dayEquityCallValue: String?
    var netLiquidatingValue: String?
    var cashAvailableToWithdraw: String?
    var dayTradeExcess: String?
    var pendingCash: String?
    var pendingCashEffect: String?
    var longCryptocurrencyValue: String?
    var shortCryptocurrencyValue: String?
    var cryptocurrencyMarginRequirement: String?
    var unsettledCryptocurrencyFiatAmount: String?
    var unsettledCryptocurrencyFiatEffect: String?
    var closedLoopAvailableBalance: String?
    var equityOfferingMarginRequirement: String?
    var longBondValue: String?
    var bondMarginRequirement: String?
    var usedDerivativeBuyingPower: String?
    var specialMemorandumAccountValue: String?
    var specialMemorandumAccountApexAdjustment: String?
    var totalSettleBalance: String?
    var marginSettleBalance: String?
    var cashSettleBalance: String?
    var smaEquityOptionBuyingPower: String?
    var snapshotDate: String?
    var timeOfDay: String?

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
