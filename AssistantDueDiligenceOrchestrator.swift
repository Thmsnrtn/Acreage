//
//  AssistantDueDiligenceOrchestrator.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

class AssistantDueDiligenceOrchestrator {
    static let shared = AssistantDueDiligenceOrchestrator()

    private init() {}

    func evaluate(property: Property) -> DueDiligenceReport {
        var checklist: [DueDiligenceItem] = []

        checklist.append(.init(name: "Access", passed: property.hasLegalAccess))
        checklist.append(.init(name: "Back Taxes", passed: !(property.hasBackTaxes ?? false)))
        checklist.append(.init(name: "HOA/POA", passed: !(property.isInHOA ?? false)))
        checklist.append(.init(name: "Zoning", passed: property.zoning != nil))
        checklist.append(.init(name: "Flood Zone", passed: !(property.isInFloodZone ?? false)))
        checklist.append(.init(name: "Market Value Confirmed", passed: property.marketValue != nil))
        checklist.append(.init(name: "Utility Access", passed: property.hasUtilities ?? false))
        checklist.append(.init(name: "Neighbor Proximity", passed: property.neighborProximityConfirmed))

        let failedItems = checklist.filter { !$0.passed }
        let status = failedItems.isEmpty ? .passed : .flagged

        return DueDiligenceReport(propertyID: property.id, status: status, items: checklist)
    }
}

struct DueDiligenceReport {
    let propertyID: UUID
    let status: DueDiligenceStatus
    let items: [DueDiligenceItem]
}

struct DueDiligenceItem {
    let name: String
    let passed: Bool
}

enum DueDiligenceStatus: String {
    case passed, flagged
}
