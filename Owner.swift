//
//  Owner.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

struct Owner: Identifiable, Codable, Hashable {
    var id = UUID()
    var fullName: String
    var mailingAddress: String
    var phone: String?
    var email: String?
    var notes: String?
}
