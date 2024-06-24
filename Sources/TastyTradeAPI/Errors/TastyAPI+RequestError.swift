//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/19/24.
//

import Foundation

extension TastyAPI {
    
    public enum RequestError: Error, Equatable {
        
        case noAuthorization
        case urlCreationFailure
        case encodingFailure
        case decodingFailure
        case requestFailure
        case other(String)
        
    }
    
}
