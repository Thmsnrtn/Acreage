//
//  DocumentFormatter.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

class DocumentFormatter {
    static func fill(template: String, with values: [String: String]) -> String {
        var result = template
        for (key, value) in values {
            result = result.replacingOccurrences(of: "{{\(key)}}", with: value)
        }
        return result
    }
}
