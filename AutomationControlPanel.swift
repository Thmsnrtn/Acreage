//
//  AutomationControlPanel.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import SwiftUI

struct AutomationControlPanelView: View {
    @ObservedObject var settings = AutomationSettingsManager.shared

    var body: some View {
        Form {
            Section(header: Text("Mail Handling")) {
                Toggle("Auto-resend Returned Mail", isOn: $settings.autoResendReturnedMail)
                Toggle("Auto-classify Scanned Mail", isOn: $settings.autoClassifyScannedMail)
            }

            Section(header: Text("Offer Workflow")) {
                Toggle("Auto-generate Offers", isOn: $settings.autoGenerateOffers)
                Toggle("Auto-send Without Review", isOn: $settings.autoSendOffersWithoutReview)
            }

            Section(header: Text("CRM Management")) {
                Toggle("Auto-create Buyer/Seller Leads", isOn: $settings.autoCreateLeadsFromMail)
            }
        }
        .navigationTitle("Automation Settings")
        .padding()
    }
}
