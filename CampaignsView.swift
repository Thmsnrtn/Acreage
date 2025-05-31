//
//  CampaignsView.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import SwiftUI

struct CampaignsView: View {
    @EnvironmentObject var campaignManager: CampaignManager
    @State private var showingNewCampaign = false

    var body: some View {
        NavigationView {
            List {
                ForEach(campaignManager.campaigns) { campaign in
                    NavigationLink(destination: CampaignDetailView(campaign: campaign)) {
                        CampaignRowView(campaign: campaign)
                    }
                }
            }
            .navigationTitle("Marketing Campaigns")
            .toolbar {
                Button(action: {
                    showingNewCampaign.toggle()
                }) {
                    Label("New Campaign", systemImage: "plus")
                }
            }
            .sheet(isPresented: $showingNewCampaign) {
                AddCampaignModal()
                    .environmentObject(campaignManager)
            }
        }
    }
}
