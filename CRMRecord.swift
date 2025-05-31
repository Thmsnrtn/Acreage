//
//  CRMRecord.swift
//  Acreage
//
//  Created by Tom on 5/30/25.
//

import Foundation

struct CRMRecord: Identifiable, Codable {
    var id: UUID = UUID()
    var name: String
    var email: String
    var phone: String?
    var status: CRMStatus
    var tags: [String]
}

enum CRMStatus: String, Codable, CaseIterable {
    case lead, contact, opportunity, closed, rejected
}
