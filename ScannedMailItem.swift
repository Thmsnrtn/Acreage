//
//  ScannedMailItem.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

struct ScannedMailItem: Identifiable, Codable {
    let id: UUID
    let sender: String
    let subject: String
    let content: String
    let receivedDate: Date
}
