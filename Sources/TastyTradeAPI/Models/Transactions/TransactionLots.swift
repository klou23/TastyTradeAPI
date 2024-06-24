//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/19/24.
//

import Foundation

public struct TransactionLots: Codable {
    public var id: String?
    public var transactionId: Int?
    public var quantity: String?
    public var price: String?
    public var quantityDirection: String?
    public var executedAt: String?
    public var transactionDate: String?
    
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
