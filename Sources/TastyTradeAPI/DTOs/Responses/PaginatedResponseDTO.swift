//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/21/24.
//

import Foundation

struct PaginatedResponseDTO<T: Codable>: Codable {
    var data: ListResponseModel<T>
    var context: String
    var pagination: Pagination
}
