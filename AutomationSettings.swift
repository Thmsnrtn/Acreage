//
//  AutomationSettings.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//
import Foundation

/// Represents user preferences for how automated various processes in the Acreage system should be.
struct AutomationSettings: Codable, Hashable {
    var mailApprovalRequired: Bool = true
    var offerLetterAutoSendEnabled: Bool = false
    var autoGenerateDeeds: Bool = false
    var autoUploadToMarketplace: Bool = false
    var enableCapitalManagement: Bool = false
    var virtualMailboxIntegration: Bool = false
    var autoPayTaxes: Bool = false
    var assistantContextAwarenessEnabled: Bool = true
    var autoRunDueDiligence: Bool = false
    var buyerFollowupAutomation: Bool = false
    var neighborLetterEnabled: Bool = true
    var overrideDefaults: Bool = false
}
