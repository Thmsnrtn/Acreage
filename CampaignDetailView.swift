//
//  CampaignDetailView.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import SwiftUI

struct CampaignDetailView: View {
    @ObservedObject var campaign: MarketingCampaign

    var body: some View {
        Form {
            Section(header: Text("Campaign Info")) {
                TextField("Title", text: $campaign.title)
                TextField("Description", text: $campaign.details)
                DatePicker("Launch Date", selection: $campaign.launchDate, displayedComponents: .date)
            }

            Section(header: Text("Status")) {
                Text(campaign.status.rawValue)
            }

            if let report = campaign.analytics {
                Section(header: Text("Performance")) {
                    Text("Delivered: \(report.delivered)")
                    Text("Opened: \(report.opened)")
                    Text("Responses: \(report.responses)")
                }
            }

            Section {
                Button("View Linked Leads") {
                    // TODO: Navigation to linked leads
                }
                .disabled(campaign.leads.isEmpty)
            }
        }
        .navigationTitle("Campaign Details")
        .padding()
    }
}
