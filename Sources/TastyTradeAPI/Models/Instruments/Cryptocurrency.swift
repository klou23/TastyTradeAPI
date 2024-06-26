//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/25/24.
//

import Foundation

/// Data model for a cryptocurrency instrument
public struct Cryptocurrency: Codable {
    var id: Int?
    var symbol: String?
    var instrumentType: String?
    var shortDescription: String?
    var description: String?
    var isClosingOnly: Bool?
    var active: Bool?
    var tickSize: String?
    var streamerSymbol: String?
    var destinationVenueSymbols: [DestinationVenueSymbol]?

    private enum CodingKeys: String, CodingKey {
        case id
        case symbol
        case instrumentType = "instrument-type"
        case shortDescription = "short-description"
        case description
        case isClosingOnly = "is-closing-only"
        case active
        case tickSize = "tick-size"
        case streamerSymbol = "streamer-symbol"
        case destinationVenueSymbols = "destination-venue-symbols"
    }
}
