//
//  PurchaseFlow.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

struct PurchaseFlow {
    static func generateOfferLetter(for property: Property, using template: String) -> String {
        return template
            .replacingOccurrences(of: "{{OWNER_NAME}}", with: property.ownerName ?? "")
            .replacingOccurrences(of: "{{PROPERTY_ADDRESS}}", with: property.fullAddress)
            .replacingOccurrences(of: "{{OFFER_AMOUNT}}", with: "$\(Int(property.assessedValue * 0.25))")
    }

    static func shouldSendOffer(for property: Property) -> Bool {
        return PurchaseAnalyzer.analyze(property: property) != .low
    }
}
