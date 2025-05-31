//
//  PrintUtilities.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

class PrintUtilities {
    static func exportDocument(ofType type: DocumentType, for lead: Lead, templateManager: DocumentTemplateManager) -> URL? {
        guard let template = templateManager.template(for: type) else { return nil }

        let values: [String: String] = [
            "owner_name": "\(lead.firstName) \(lead.lastName)",
            "property_address": lead.propertyAddress,
            "offer_price": lead.offerAmount?.formatted() ?? "",
            "sender_name": "Acreage Executive",
            "buyer_name": "Acreage Executive",
            "seller_name": "\(lead.firstName) \(lead.lastName)",
            "purchase_price": lead.offerAmount?.formatted() ?? "",
            "closing_days": "14",
            "grantor_name": "\(lead.firstName) \(lead.lastName)",
            "grantee_name": "Acreage Executive",
            "property_description": lead.propertyAddress,
            "amount": lead.offerAmount?.formatted() ?? "",
            "date": DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .none)
        ]

        let rendered = DocumentFormatter.fill(template: template.content, with: values)
        return PDFExporter.export(content: rendered, fileName: template.name.replacingOccurrences(of: " ", with: "_"))
    }
}
