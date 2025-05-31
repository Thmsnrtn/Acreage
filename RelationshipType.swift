//
//  RelationshipType.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

enum RelationshipType: String, Codable, CaseIterable {
    case seller = "Seller"
    case buyer = "Buyer"
    case agent = "Agent"
    case titleCompany = "Title Company"
    case lender = "Lender"
    case partner = "Partner"
    case other = "Other"
}
