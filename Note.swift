//
//  Note.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

struct Note: Identifiable, Codable, Hashable {
    var id = UUID()
    var date: Date
    var content: String
    var author: String

    init(content: String, author: String = "System", date: Date = Date()) {
        self.content = content
        self.author = author
        self.date = date
    }
}
