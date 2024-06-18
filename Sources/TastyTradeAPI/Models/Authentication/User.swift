//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/17/24.
//

import Foundation

struct User: Codable {
    var email: String?
    var name: String?
    var nickname: String?
    var username: String?
    var externalId: String?
    var isConfirmed: String?
    
    private enum CodingKeys: String, CodingKey {
        case email
        case name
        case nickname
        case username
        case externalId = "external-id"
        case isConfirmed = "is-confirmed"
    }
}
