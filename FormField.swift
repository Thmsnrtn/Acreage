//
//  FormField.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

struct FormField: Identifiable, Codable {
    var id = UUID()
    var label: String
    var value: String
}
