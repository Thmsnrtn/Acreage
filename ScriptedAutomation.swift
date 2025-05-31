//
//  ScriptedAutomation.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

struct ScriptedAutomation: Identifiable, Codable {
    var id: UUID
    var title: String
    var triggerEvent: String
    var actionSequence: [AutomationAction]
}

struct AutomationAction: Identifiable, Codable {
    var id: UUID
    var type: String
    var parameters: [String: String]
}
