//
//  PurchaseManager.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

class PurchaseManager: ObservableObject {
    static let shared = PurchaseManager()

    @Published var pendingPurchases: [Property] = []

    func prepareOffer(for property: Property) -> String {
        let template = TemplateManager.shared.loadTemplate(named: "Offer Letter Template") ?? ""
        return PurchaseFlow.generateOfferLetter(for: property, using: template)
    }

    func queueProperty(_ property: Property) {
        if !pendingPurchases.contains(where: { $0.id == property.id }) {
            pendingPurchases.append(property)
        }
    }

    func clear() {
        pendingPurchases.removeAll()
    }
}
