//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/19/24.
//

import Foundation

extension TastyAPI {
    
    enum RequestError: Error {
        
        case noAuthorization
        case urlCreationFailure
        case encodingFailure
        case decodingFailure
        case requestFailure
        case other(String)
        
    }
    
}
