//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/21/24.
//

import Foundation

struct ListResponseModel<T: Codable>: Codable {
    var items: [T]
}
