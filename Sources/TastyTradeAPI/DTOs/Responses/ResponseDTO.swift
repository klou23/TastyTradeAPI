//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/21/24.
//

import Foundation

struct ResponseDTO<T: Codable>: Codable {
    var data: T
    var context: String
}
