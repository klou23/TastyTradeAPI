//
//  File.swift
//  
//
//  Created by Kevin Lou on 6/21/24.
//

import Foundation

public struct Pagination: Codable {
    public var perPage: Int
    public var pageOffset: Int
    public var itemOffset: Int
    public var totalItems: Int
    public var totalPages: Int
    public var currentItemCount: Int
    public var previousLink: String?
    public var nextLink: String?
    public var pagingLinkTemplate: String?
    
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
