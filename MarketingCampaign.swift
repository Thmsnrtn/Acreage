//
//  MarketingCampaign.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

struct MarketingCampaign: Identifiable, Codable {
    var id = UUID()
    var name: String
    var serviceProvider: MailServiceProvider
    var templateId: UUID
    var labelStyle: String
    var approvalRequired: Bool
}
