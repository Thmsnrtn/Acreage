//
//  Untitled.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

struct MarketingRecord: Codable, Identifiable {
    var id = UUID()
    var campaignName: String
    var dateSent: Date
    var channel: String // e.g. "Mail", "Email", "Text"
    var notes: String

    init(campaignName: String = "", dateSent: Date = Date(), channel: String = "", notes: String = "") {
        self.campaignName = campaignName
        self.dateSent = dateSent
        self.channel = channel
        self.notes = notes
    }

    init(from lead: Lead) {
        self.campaignName = "Campaign for \(lead.name)"
        self.dateSent = Date()
        self.channel = "Mail"
        self.notes = "Automated entry based on lead data."
    }
}
