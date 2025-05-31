//
//  AssistantPortfolioInsightEngine.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

class AssistantPortfolioInsightEngine {
    static let shared = AssistantPortfolioInsightEngine()
    
    private init() {}

    func generatePortfolioSummary(from properties: [Property]) -> String {
        guard !properties.isEmpty else { return "No properties in your portfolio." }
        
        let totalProperties = properties.count
        let totalPurchasePrice = properties.compactMap { $0.purchasePrice }.reduce(0, +)
        let totalMarketValue = properties.compactMap { $0.marketValue }.reduce(0, +)
        let averageROI = properties.compactMap { $0.roi }.average()

        var summary = "📊 Portfolio Overview\n"
        summary += "- Total Properties: \(totalProperties)\n"
        summary += "- Total Purchase Price: $\(String(format: "%.2f", totalPurchasePrice))\n"
        summary += "- Total Market Value: $\(String(format: "%.2f", totalMarketValue))\n"
        summary += "- Average ROI: \(String(format: "%.2f", averageROI))%\n"

        return summary
    }
}

private extension Array where Element == Double {
    func average() -> Double {
        guard !isEmpty else { return 0.0 }
        return reduce(0, +) / Double(count)
    }
}
