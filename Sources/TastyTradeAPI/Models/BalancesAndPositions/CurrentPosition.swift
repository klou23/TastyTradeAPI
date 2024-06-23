//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/22/24.
//

import Foundation

struct CurrentPosition: Codable {
    var accountNumber: String?
    var symbol: String?
    var instrumentType: String?
    var underlyingSymbol: String?
    var quantity: Quantity?
    var quantityDirection: String?
    var closePrice: String?
    var averageOpenPrice: String?
    var averageYearlyMarketClosePrice: String?
    var averageDailyMarketClosePrice: String?
    var mark: String?
    var markPrice: String?
    var multiplier: Int?
    var costEffect: String?
    var isSuppressed: Bool?
    var isFrozen: Bool?
    var restrictedQuantity: RestrictedQuantity?
    var expiresAt: String?
    var fixingPrice: String?
    var deliverableType: String?
    var realizedDayGain: String?
    var realizedDayGainEffect: String?
    var realizedDayGainDate: String?
    var realizedToday: String?
    var realizedTodayEffect: String?
    var realizedTodayDate: String?
    var createdAt: String?
    var updatedAt: String?
    var orderId: Int?

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
