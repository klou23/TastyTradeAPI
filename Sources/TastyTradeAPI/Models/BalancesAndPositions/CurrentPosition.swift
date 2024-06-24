//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/22/24.
//

import Foundation

/// Data model for storing an owned position
///
/// A list of this type is returned from ``TastyAPI/positions(accountNumber:underlyingSymbol:symbol:instrumentType:includeClosedPositions:underlyingProductCode:partitionKeys:netPositions:includeMarks:)``.
///
///  More info can be found in the [TastyTrade API Docs](https://developer.tastytrade.com/open-api-spec/balances-and-positions/#/).
public struct CurrentPosition: Codable {
    public var accountNumber: String?
    public var symbol: String?
    public var instrumentType: String?
    public var underlyingSymbol: String?
    public var quantity: Quantity?
    public var quantityDirection: String?
    public var closePrice: String?
    public var averageOpenPrice: String?
    public var averageYearlyMarketClosePrice: String?
    public var averageDailyMarketClosePrice: String?
    public var mark: String?
    public var markPrice: String?
    public var multiplier: Int?
    public var costEffect: String?
    public var isSuppressed: Bool?
    public var isFrozen: Bool?
    public var restrictedQuantity: RestrictedQuantity?
    public var expiresAt: String?
    public var fixingPrice: String?
    public var deliverableType: String?
    public var realizedDayGain: String?
    public var realizedDayGainEffect: String?
    public var realizedDayGainDate: String?
    public var realizedToday: String?
    public var realizedTodayEffect: String?
    public var realizedTodayDate: String?
    public var createdAt: String?
    public var updatedAt: String?
    public var orderId: Int?

    private enum CodingKeys: String, CodingKey {
        case accountNumber = "account-number"
        case symbol
        case instrumentType = "instrument-type"
        case underlyingSymbol = "underlying-symbol"
        case quantity
        case quantityDirection = "quantity-direction"
        case closePrice = "close-price"
        case averageOpenPrice = "average-open-price"
        case averageYearlyMarketClosePrice = "average-yearly-market-close-price"
        case averageDailyMarketClosePrice = "average-daily-market-close-price"
        case mark
        case markPrice = "mark-price"
        case multiplier
        case costEffect = "cost-effect"
        case isSuppressed = "is-suppressed"
        case isFrozen = "is-frozen"
        case restrictedQuantity = "restricted-quantity"
        case expiresAt = "expires-at"
        case fixingPrice = "fixing-price"
        case deliverableType = "deliverable-type"
        case realizedDayGain = "realized-day-gain"
        case realizedDayGainEffect = "realized-day-gain-effect"
        case realizedDayGainDate = "realized-day-gain-date"
        case realizedToday = "realized-today"
        case realizedTodayEffect = "realized-today-effect"
        case realizedTodayDate = "realized-today-date"
        case createdAt = "created-at"
        case updatedAt = "updated-at"
        case orderId = "order-id"
    }
}
