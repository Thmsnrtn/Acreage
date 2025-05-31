//
//  Preferences.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

struct Preferences: Codable {
    var defaultOfferAmount: Double
    var autoSendOffers: Bool
    var autoPayTaxes: Bool
    var preferredMailService: String
    var assistantApprovalRequired: Bool
}
