//
//  Phase.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

struct Phase: Identifiable, Codable {
    var id = UUID()
    var name: String
    var description: String
    var completed: Bool
}
