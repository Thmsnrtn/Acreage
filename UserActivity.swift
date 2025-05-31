//
//  UserActivity.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

enum UserActionType: String, Codable {
    case addedLead
    case updatedLead
    case launchedCampaign
    case paidTax
    case generatedDocument
    case reviewedMail
}

struct UserActivity: Identifiable, Codable {
    var id = UUID()
    var timestamp: Date
    var action: UserActionType
    var detail: String
}
