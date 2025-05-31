//
//  ReceiptParser.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

struct ReceiptParser {
    static func parse(data: Data) -> Receipt? {
        // Placeholder parser — expand as needed
        return try? JSONDecoder().decode(Receipt.self, from: data)
    }
}

struct Receipt: Codable {
    let id: UUID
    let date: Date
    let amount: Double
    let source: String
}
