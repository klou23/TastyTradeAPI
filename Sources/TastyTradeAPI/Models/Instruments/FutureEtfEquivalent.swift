//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/26/24.
//

import Foundation

public struct FutureEtfEquivalent: Codable {
    var symbol: String?
    var shareQuantity: Int?
    
    private enum CodingKeys: String, CodingKey {
        case symbol
        case shareQuantity = "share-quantity"
    }
}
