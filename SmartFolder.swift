//
//  SmartFolder.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

struct SmartFolder: Identifiable, Codable {
    var id = UUID()
    var name: String
    var query: String
    var sortOrder: SortOrder
}

enum SortOrder: String, Codable {
    case newestFirst, oldestFirst, alphabetical
}
