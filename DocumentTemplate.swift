//
//  DocumentTemplate.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

enum DocumentType: String, Codable, CaseIterable {
    case offerLetter
    case purchaseAgreement
    case quitclaimDeed
    case neighborLetter
    case dueDiligenceChecklist
}

struct DocumentTemplate: Identifiable, Codable {
    var id = UUID()
    var name: String
    var type: DocumentType
    var content: String
    var isDefault: Bool
}
