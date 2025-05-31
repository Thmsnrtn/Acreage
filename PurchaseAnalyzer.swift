//
//  PurchaseAnalyzer.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

struct PurchaseAnalyzer {
    static func analyze(property: Property) -> PurchaseRecommendation {
        let assessedValue = property.assessedValue
        let offer = assessedValue * 0.25

        if offer < 500 {
            return .low
        } else if offer < 2000 {
            return .medium
        } else {
            return .high
        }
    }
}

enum PurchaseRecommendation {
    case low
    case medium
    case high
}
