//
//  OfferLetterGenerator.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

class OfferLetterGenerator {
    static func generate() {
        guard let lead = LeadSelectionContext.shared.currentLead else {
            print("No lead selected for offer letter generation.")
            return
        }

        let template = TemplateLibrary.shared.template(named: "Offer Letter Template")
        let content = template?.filled(with: lead.toDictionary()) ?? "Error generating letter."
        
        DocumentExporter.export(content: content, title: "Offer Letter for \(lead.ownerName)")
    }
}
