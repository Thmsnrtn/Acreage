//
//  AssistantContextManager.swift
//  Acreage
//
//  Created by Tom on 5/30/25.
//
import Foundation

/// Tracks and updates assistant context based on user interaction and module activity.
class AssistantContextManager {
    static let shared = AssistantContextManager()
    @Published var context = AssistantContext(automationSettings: AutomationSettingsManager.shared.settings)

    private init() {}

    func updateModule(name: String) {
        context.currentModule = name
    }

    func recordViewed(screen: String) {
        context.lastViewedScreen = screen
    }

    func userIntervened() {
        context.userInterventionDetected = true
    }

    func setActiveProperty(id: UUID) {
        context.activePropertyID = id
    }

    func setModifiedLead(id: UUID) {
        context.lastModifiedLeadID = id
    }

    func refreshSettings() {
        context.automationSettings = AutomationSettingsManager.shared.settings
    }
}
