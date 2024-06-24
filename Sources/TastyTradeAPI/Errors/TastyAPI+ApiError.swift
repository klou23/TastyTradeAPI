//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/19/24.
//

import Foundation

extension TastyAPI {
    
    /// Error representing something went wrong with the API call
    public enum ApiError: Error, Equatable {
        case noStatusCode
        case http400(code: String?, message: String?)
        case http401(code: String?, message: String?)
        case http403(code: String?, message: String?)
        case http404
        case http429(code: String?, message: String?)
        case http500(code: String?, message: String?)
        case other(code: Int)
    }
    
}
