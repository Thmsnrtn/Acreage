//
//  AssistantSettings.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

struct AssistantPersonaSettings: Codable {
    var tone: AssistantTone
    var verbosity: AssistantVerbosity
    var automationAggressiveness: Int // 0-10
}

enum AssistantTone: String, CaseIterable, Codable {
    case formal
    case conversational
    case concise
}

enum AssistantVerbosity: String, CaseIterable, Codable {
    case minimal
    case normal
    case verbose
}

class AssistantSettingsManager: ObservableObject {
    static let shared = AssistantSettingsManager()

    @Published var persona = AssistantPersonaSettings(
        tone: .conversational,
        verbosity: .normal,
        automationAggressiveness: 5
    )
}
