//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/16/24.
//

import Foundation

enum AuthError: Error {
    case invalidCredentials(String)
    case other(String)
}
