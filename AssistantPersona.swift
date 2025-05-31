//
//  AssistantPersona.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

struct AssistantPersona: Codable, Identifiable {
    var id: UUID = UUID()
    var name: String
    var description: String
    var voiceStyle: String
    var tone: String
    var decisionStyle: String
    var automationAggressiveness: Int
    var preferredModules: [String]

    static let defaultPersona = AssistantPersona(
        name: "Acreage Executive",
        description: "A strategic, efficient land investor assistant focused on maximizing automation and ROI.",
        voiceStyle: "Confident and insightful",
        tone: "Professional but warm",
        decisionStyle: "Calculated with contextual override flexibility",
        automationAggressiveness: 8,
        preferredModules: [
            "Lead Management",
            "Acquisition Engine",
            "Mail Campaigns",
            "Disposition Pipeline",
            "Capital Management"
        ]
    )
}
