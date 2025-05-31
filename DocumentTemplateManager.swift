//
//  DocumentTemplateManager.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

class DocumentTemplateManager: ObservableObject {
    @Published var templates: [DocumentTemplate] = []

    func loadDefaultTemplates() {
        templates = [
            DocumentTemplate(name: "Offer Letter", type: .offerLetter, content: DefaultTemplates.offerLetter, isDefault: true),
            DocumentTemplate(name: "Purchase Agreement", type: .purchaseAgreement, content: DefaultTemplates.purchaseAgreement, isDefault: true),
            DocumentTemplate(name: "Quitclaim Deed", type: .quitclaimDeed, content: DefaultTemplates.quitclaimDeed, isDefault: true),
            DocumentTemplate(name: "Neighbor Letter", type: .neighborLetter, content: DefaultTemplates.neighborLetter, isDefault: true),
            DocumentTemplate(name: "Due Diligence Checklist", type: .dueDiligenceChecklist, content: DefaultTemplates.dueDiligenceChecklist, isDefault: true)
        ]
    }

    func template(for type: DocumentType) -> DocumentTemplate? {
        return templates.first { $0.type == type }
    }
}
