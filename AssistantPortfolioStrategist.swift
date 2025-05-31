//
//  AssistantPortfolioStrategist.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

class AssistantPortfolioStrategist {
    static let shared = AssistantPortfolioStrategist()

    private init() {}

    func evaluatePortfolio(properties: [Property]) -> [StrategicAction] {
        var actions: [StrategicAction] = []

        for property in properties {
            if property.shouldLiquidate {
                actions.append(.init(propertyID: property.id, recommendation: .liquidate(reason: "High days on market + tax burden")))
            } else if property.isUnderutilized {
                actions.append(.init(propertyID: property.id, recommendation: .remarket(reason: "Undervalued in current listing")))
            } else if property.hasNearbyExpansionOpportunities {
                actions.append(.init(propertyID: property.id, recommendation: .neighborLetter(reason: "Trigger neighbor mailer")))
            }
        }

        return actions
    }
}

struct StrategicAction {
    let propertyID: UUID
    let recommendation: RecommendationType
}

enum RecommendationType {
    case liquidate(reason: String)
    case remarket(reason: String)
    case neighborLetter(reason: String)
}
