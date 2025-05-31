//
//  AssistantContext.swift
//  Acreage
//
//  Created by Tom on 5/30/25.
//
import Foundation

/// Captures system context the assistant uses to reason about user activity and workflows.
struct AssistantContext {
    var currentModule: String?
    var lastModifiedLeadID: UUID?
    var activePropertyID: UUID?
    var userInterventionDetected: Bool = false
    var lastViewedScreen: String?
    var automationSettings: AutomationSettings
}
