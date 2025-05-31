//
//  Organization.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

struct Organization: Codable, Identifiable {
    var id = UUID()
    var name: String
    var type: String
    var contactInfo: String
    var notes: String
}
