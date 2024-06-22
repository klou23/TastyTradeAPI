//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/21/24.
//

import Foundation

struct Pagination: Codable {
    var perPage: Int
    var pageOffset: Int
    var itemOffset: Int
    var totalItems: Int
    var totalPages: Int
    var currentItemCount: Int
    var previousLink: String?
    var nextLink: String?
    var pagingLinkTemplate: String?
    
    private enum CodingKeys: String, CodingKey {
        case perPage = "per-page"
        case pageOffset = "page-offset"
        case itemOffset = "item-offset"
        case totalItems = "total-items"
        case totalPages = "total-pages"
        case currentItemCount = "current-item-count"
        case previousLink = "previous-link"
        case nextLink = "next-link"
        case pagingLinkTemplate = "paging-link-template"
    }
}
