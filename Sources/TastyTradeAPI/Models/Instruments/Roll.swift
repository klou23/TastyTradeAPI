//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/26/24.
//

import Foundation

public struct Roll: Codable {
    var name: String?
    var activeCount: Int?
    var cashSettled: Bool?
    var businessDaysOffset: Int?
    var firstNotice: Bool?
    
    private enum CodingKeys: String, CodingKey {
        case name
        case activeCount = "active-count"
        case cashSettled = "cash-settled"
        case businessDaysOffset = "business-days-offset"
        case firstNotice = "first-notice"
    }
}
