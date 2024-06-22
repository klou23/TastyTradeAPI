//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/17/24.
//

import Foundation

struct LoginResponseData: Codable {
    var user: User?
    var sessionToken: String?
    var rememberToken: String?
    
    private enum CodingKeys: String, CodingKey {
        case user
        case sessionToken = "session-token"
        case rememberToken = "remember-token"
    }
}
