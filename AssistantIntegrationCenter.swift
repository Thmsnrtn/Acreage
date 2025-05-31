//
//  AssistantIntegrationCenter.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

class AssistantIntegrationCenter: ObservableObject {
    static let shared = AssistantIntegrationCenter()

    func initializeAssistantStack() {
        AssistantContextMonitor.shared.observe(viewName: "Dashboard")
        AssistantStrategicPlanner.shared.analyzeMarketConditions()
        AssistantBusinessDashboard.shared.refreshMetrics()
        AssistantAutomationToggles.shared.toggles.forEach { toggle in
            AssistantMemoryEngine.shared.record(action: "Toggle Check", context: "\(toggle.title): \(toggle.isEnabled ? "On" : "Off")")
        }
    }
}
