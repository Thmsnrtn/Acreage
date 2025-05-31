//
//  TemplateManager.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

class TemplateManager: ObservableObject {
    @Published var templates: [Template] = []

    init() {
        loadDefaultTemplates()
    }

    private func loadDefaultTemplates() {
        templates = [
            Template(type: .offerLetter, name: "Offer Letter", content: "Dear {{OwnerName}},\nWe are interested in purchasing your property..."),
            Template(type: .neighborLetter, name: "Neighbor Letter", content: "Hello,\nWe’re offering a unique chance to expand your land holdings..."),
            Template(type: .purchaseAgreement, name: "Purchase Agreement", content: "PURCHASE AGREEMENT\nThis agreement is made between..."),
            Template(type: .quitclaimDeed, name: "Quitclaim Deed", content: "This Quitclaim Deed made on the date of..."),
            Template(type: .dueDiligenceSheet, name: "Due Diligence Checklist", content: "1. Verify Ownership\n2. Confirm Legal Access...")
        ]
    }

    func getTemplate(for type: TemplateType) -> Template? {
        return templates.first { $0.type == type }
    }

    func updateTemplate(_ template: Template) {
        if let index = templates.firstIndex(where: { $0.id == template.id }) {
            templates[index] = template
        }
    }
}
