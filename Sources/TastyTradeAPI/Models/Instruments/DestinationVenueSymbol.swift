//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/25/24.
//

import Foundation

/// Data model for storing a destination venue symbol
///
/// This type is used in ``Cryptocurrency``
public struct DestinationVenueSymbol: Codable {
    public var id: Int?
    public var symbol: String?
    public var destinationVenue: String?
    public var maxQuantityPrecision: Int?
    public var maxPricePrecision: Int?
    public var routable: Bool?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case symbol
        case destinationVenue = "destination-venue"
        case maxQuantityPrecision = "max-quantity-precision"
        case maxPricePrecision = "max-price-precision"
        case routable
    }
}
