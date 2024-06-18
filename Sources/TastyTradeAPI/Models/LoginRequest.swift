//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/16/24.
//

import Foundation

struct LoginRequest: Codable {
    var login: String
    var password: String?
    var rememberMe: Bool
    var rememberToken: String?
    
    private enum CodingKeys: String, CodingKey {
        case login
        case password
        case rememberMe = "remember-me"
        case rememberToken = "remember-token"
    }
}
