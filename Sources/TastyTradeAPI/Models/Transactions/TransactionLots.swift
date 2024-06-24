//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/19/24.
//

import Foundation

public struct TransactionLots: Codable {
    var id: String?
    var transactionId: Int?
    var quantity: String?
    var price: String?
    var quantityDirection: String?
    var executedAt: String?
    var transactionDate: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case transactionId = "transaction-id"
        case quantity
        case price
        case quantityDirection = "quantity-direction"
        case executedAt = "executed-at"
        case transactionDate = "transaction-date"
    }
}
