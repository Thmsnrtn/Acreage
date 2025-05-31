//
//  LegalTemplate.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

struct LegalTemplate: Identifiable, Codable {
    var id = UUID()
    var title: String
    var content: String
    var category: TemplateCategory

    enum TemplateCategory: String, Codable, CaseIterable {
        case offerLetter
        case purchaseAgreement
        case quitclaimDeed
        case neighborLetter
        case custom
    }
}
