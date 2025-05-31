//
//  Portfolio.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

struct Portfolio: Identifiable, Codable {
    var id = UUID()
    var name: String
    var properties: [Property]
    var totalValue: Double
    var notes: String
}
