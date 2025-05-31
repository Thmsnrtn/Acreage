//
//  SettingsView.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var mailAutomationSettings = MailAutomationSettings()

    var body: some View {
        TabView {
            AutomationSettingsView(automationSettings: mailAutomationSettings)
                .tabItem {
                    Label("Automation", systemImage: "gear")
                }

            // ... additional tabs here ...
        }
    }
}
