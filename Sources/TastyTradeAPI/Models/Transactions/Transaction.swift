//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/19/24.
//

import Foundation

public struct Transaction: Codable {
    var id: Int?
    var accountNumber: String?
    var symbol: String?
    var instrumentType: String?
    var underlyingSymbol: String?
    var transactionType: String?
    var transactionSubType: String?
    var description: String?
    var action: String?
    var quantity: String?
    var price: String?
    var executedAt: String?
    var transactionDate: String?
    var value: String?
    var valueEffect: String?
    var regulatoryFees: String?
    var regulatoryFeesEffect: String?
    var clearingFees: String?
    var clearingFeesEffect: String?
    var otherCharge: String?
    var otherChargeEffect: String?
    var otherChargeDescription: String?
    var netValue: String?
    var netValueEffect: String?
    var commission: String?
    var commissionEffect: String?
    var proprietaryIndexOptionFees: String?
    var proprietaryIndexOptionFeesEffect: String?
    var isEstimatedFee: Bool?
    var extExchangeOrderNumber: String?
    var extGlobalOrderNumber: Int?
    var extGroupId: String?
    var extGroupFillId: String?
    var extExecId: String?
    var execId: String?
    var exchange: String?
    var orderId: Int?
    var reversesId: Int?
    var exchangeAffiliationIdentifier: String?
    var costBasisReconciliationDate: String?
    var lots: TransactionLots?
    var legCount: Int?
    var destinationVenue: String?
    var agencyPrice: String?
    var principalPrice: String?
    var currency: String?
    var currencyConversionFees: String?
    var currencyConversionFeesEffect: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case accountNumber = "account-number"
        case symbol
        case instrumentType = "instrument-type"
        case underlyingSymbol = "underlying-symbol"
        case transactionType = "transaction-type"
        case transactionSubType = "transaction-sub-type"
        case description
        case action
        case quantity
        case price
        case executedAt = "executed-at"
        case transactionDate = "transaction-date"
        case value
        case valueEffect = "value-effect"
        case regulatoryFees = "regulatory-fees"
        case regulatoryFeesEffect = "regulatory-fees-effect"
        case clearingFees = "clearing-fees"
        case clearingFeesEffect = "clearing-fees-effect"
        case otherCharge = "other-charge"
        case otherChargeEffect = "other-charge-effect"
        case otherChargeDescription = "other-charge-description"
        case netValue = "net-value"
        case netValueEffect = "net-value-effect"
        case commission
        case commissionEffect = "commission-effect"
        case proprietaryIndexOptionFees = "proprietary-index-option-fees"
        case proprietaryIndexOptionFeesEffect = "proprietary-index-option-fees-effect"
        case isEstimatedFee = "is-estimated-fee"
        case extExchangeOrderNumber = "ext-exchange-order-number"
        case extGlobalOrderNumber = "ext-global-order-number"
        case extGroupId = "ext-group-id"
        case extGroupFillId = "ext-group-fill-id"
        case extExecId = "ext-exec-id"
        case execId = "exec-id"
        case exchange
        case orderId = "order-id"
        case reversesId = "reverses-id"
        case exchangeAffiliationIdentifier = "exchange-affiliation-identifier"
        case costBasisReconciliationDate = "cost-basis-reconciliation-date"
        case lots
        case legCount = "leg-count"
        case destinationVenue = "destination-venue"
        case agencyPrice = "agency-price"
        case principalPrice = "principal-price"
        case currency
        case currencyConversionFees = "currency-conversion-fees"
        case currencyConversionFeesEffect = "currency-conversion-fees-effect"
    }
}
