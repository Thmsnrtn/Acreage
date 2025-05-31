//
//  DueDiligenceChecklist.swift
//  Acreage
//
//  Created by Tom on 5/30/25.
//

import Foundation

struct DueDiligenceItem: Identifiable, Codable {
    var id = UUID()
    var title: String
    var description: String
    var isComplete: Bool
}

class DueDiligenceChecklist: ObservableObject {
    @Published var items: [DueDiligenceItem] = []

    func markComplete(_ id: UUID) {
        if let index = items.firstIndex(where: { $0.id == id }) {
            items[index].isComplete = true
        }
    }

    func loadDefaultChecklist() {
        items = [
            .init(title: "Verify ownership", description: "Ensure title matches owner", isComplete: false),
            .init(title: "Check back taxes", description: "Verify outstanding property taxes", isComplete: false),
            .init(title: "Review legal access", description: "Ensure there's legal road access", isComplete: false)
        ]
    }
}
