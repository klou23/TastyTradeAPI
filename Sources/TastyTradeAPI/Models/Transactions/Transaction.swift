//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/19/24.
//

import Foundation

public struct Transaction: Codable {
    public var id: Int?
    public var accountNumber: String?
    public var symbol: String?
    public var instrumentType: String?
    public var underlyingSymbol: String?
    public var transactionType: String?
    public var transactionSubType: String?
    public var description: String?
    public var action: String?
    public var quantity: String?
    public var price: String?
    public var executedAt: String?
    public var transactionDate: String?
    public var value: String?
    public var valueEffect: String?
    public var regulatoryFees: String?
    public var regulatoryFeesEffect: String?
    public var clearingFees: String?
    public var clearingFeesEffect: String?
    public var otherCharge: String?
    public var otherChargeEffect: String?
    public var otherChargeDescription: String?
    public var netValue: String?
    public var netValueEffect: String?
    public var commission: String?
    public var commissionEffect: String?
    public var proprietaryIndexOptionFees: String?
    public var proprietaryIndexOptionFeesEffect: String?
    public var isEstimatedFee: Bool?
    public var extExchangeOrderNumber: String?
    public var extGlobalOrderNumber: Int?
    public var extGroupId: String?
    public var extGroupFillId: String?
    public var extExecId: String?
    public var execId: String?
    public var exchange: String?
    public var orderId: Int?
    public var reversesId: Int?
    public var exchangeAffiliationIdentifier: String?
    public var costBasisReconciliationDate: String?
    public var lots: TransactionLots?
    public var legCount: Int?
    public var destinationVenue: String?
    public var agencyPrice: String?
    public var principalPrice: String?
    public var currency: String?
    public var currencyConversionFees: String?
    public var currencyConversionFeesEffect: String?
    
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
