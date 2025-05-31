//
//  MarketingEngine.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

class MarketingEngine {
    static let shared = MarketingEngine()

    func launchCampaign(_ campaign: MarketingCampaign, leads: [Lead], templates: [LegalTemplate]) {
        guard let template = templates.first(where: { $0.id == campaign.templateId }) else { return }

        for lead in leads {
            let personalized = template.content
                .replacingOccurrences(of: "{name}", with: lead.name ?? "Valued Owner")
                .replacingOccurrences(of: "{property_description}", with: lead.propertyDescription ?? "Property")
            let address = lead.mailingAddress ?? "Unknown Address"
            print("Would send to \(address):\n\(personalized)")
        }
    }
}
