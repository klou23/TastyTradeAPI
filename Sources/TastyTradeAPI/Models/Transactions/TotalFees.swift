//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/21/24.
//

import Foundation

public struct TotalFees: Codable {
    public var totalFees: String?
    public var totalFeesEffect: String?
    
    private enum CodingKeys: String, CodingKey {
        case totalFees = "total-fees"
        case totalFeesEffect = "total-fees-effect"
    }
}
