//
//  CampaignManager.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation
import Combine

class CampaignManager: ObservableObject {
    @Published var campaigns: [MarketingCampaign] = []

    func createCampaign(from leads: [Lead], title: String, description: String) {
        let campaign = MarketingCampaign(
            title: title,
            details: description,
            launchDate: Date(),
            leads: leads,
            status: .draft
        )
        campaigns.append(campaign)
    }

    func launchCampaign(_ campaign: MarketingCampaign) {
        guard let index = campaigns.firstIndex(where: { $0.id == campaign.id }) else { return }
        campaigns[index].status = .active
        // TODO: Trigger mailing provider integration
    }

    func archiveCampaign(_ campaign: MarketingCampaign) {
        guard let index = campaigns.firstIndex(where: { $0.id == campaign.id }) else { return }
        campaigns[index].status = .archived
    }
}
