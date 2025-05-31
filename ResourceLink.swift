//
//  ResourceLink.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

struct ResourceLink: Identifiable, Codable {
    var id = UUID()
    var title: String
    var url: String
    var category: ResourceCategory
}

enum ResourceCategory: String, Codable, CaseIterable {
    case legal
    case marketing
    case research
    case county
    case forms
    case other
}
