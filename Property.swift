//
//  Property.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation
import CoreLocation

struct Property: Identifiable, Codable {
    var id = UUID()
    var apn: String
    var county: String
    var state: String
    var acreage: Double
    var latitude: Double
    var longitude: Double
    var ownerName: String
    var ownerAddress: String
    var assessedValue: Double
    var taxesDue: Double
    var status: PropertyStatus
    var dateAdded: Date
    var tags: [String]
}

enum PropertyStatus: String, Codable, CaseIterable {
    case new = "New"
    case underReview = "Under Review"
    case offerSent = "Offer Sent"
    case underContract = "Under Contract"
    case inPortfolio = "In Portfolio"
    case marketed = "Marketed"
    case sold = "Sold"
}
