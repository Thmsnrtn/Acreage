//
//  PropertyAnalyzer.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

class PropertyAnalyzer {
    static func analyze(property: Property) -> String {
        var score = 0.0

        score += property.acreage > 1 ? 10 : 0
        score += property.taxesDue < 100 ? 10 : 0
        score += property.assessedValue < 10000 ? 10 : 0

        return score > 20 ? "High Potential" : "Moderate or Low"
    }
}
