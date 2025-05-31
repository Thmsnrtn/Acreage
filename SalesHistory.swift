//
//  SalesHistory.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

struct SalesHistory: Identifiable, Codable {
    var id: UUID
    var propertyID: UUID
    var saleDate: Date
    var salePrice: Double
    var buyerName: String
}
