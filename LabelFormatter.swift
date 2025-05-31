//
//  LabelFormatter.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

class LabelFormatter {
    static func formatMailingLabel(name: String, address: String, city: String, state: String, zip: String) -> String {
        return """
        \(name)
        \(address)
        \(city), \(state) \(zip)
        """
    }
}
