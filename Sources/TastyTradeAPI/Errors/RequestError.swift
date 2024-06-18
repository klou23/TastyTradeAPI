//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/16/24.
//

import Foundation

enum RequestError: Error {
    
    case badURL
    case encodeFailure
    case requestFailure
    case noStatusCode
    case decodeFailure
    case other(String)
    
}
