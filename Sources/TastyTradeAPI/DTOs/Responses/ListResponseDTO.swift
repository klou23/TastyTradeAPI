//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/22/24.
//

import Foundation

struct ListResponseDTO<T: Codable>: Codable {
    var data: ListResponseModel<T>
    var context: String
}
