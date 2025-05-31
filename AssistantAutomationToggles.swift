//
//  AssistantAutomationToggles.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

struct AutomationToggle: Identifiable, Codable {
    let id = UUID()
    let title: String
    var isEnabled: Bool
    var description: String
}

class AssistantAutomationToggles: ObservableObject {
    static let shared = AssistantAutomationToggles()

    @Published var toggles: [AutomationToggle] = [
        AutomationToggle(title: "Auto-Send Offers", isEnabled: false, description: "Automatically send offer letters without manual review."),
        AutomationToggle(title: "Auto-Market to Neighbors", isEnabled: true, description: "Automatically send letters to neighboring parcels on new acquisitions."),
        AutomationToggle(title: "Auto-Pay Property Taxes", isEnabled: false, description: "Submit property tax payments automatically when due."),
        AutomationToggle(title: "Auto-Generate Deeds", isEnabled: true, description: "Generate deeds automatically when sale conditions are met.")
    ]

    func toggle(for title: String) -> AutomationToggle? {
        toggles.first(where: { $0.title == title })
    }

    func updateToggle(_ title: String, isEnabled: Bool) {
        if let index = toggles.firstIndex(where: { $0.title == title }) {
            toggles[index].isEnabled = isEnabled
        }
    }
}
