//
//  ROITracker.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

class ROITracker: ObservableObject {
    @Published var roiSummaries: [ROISummary] = []

    func calculateROI(for deal: Deal) -> ROISummary {
        let roi = ((deal.soldPrice - deal.purchasePrice - deal.expenses) / deal.purchasePrice) * 100
        let summary = ROISummary(id: UUID(), dealID: deal.id, roiPercentage: roi, date: Date())
        roiSummaries.append(summary)
        return summary
    }
}

struct ROISummary: Identifiable, Codable {
    var id: UUID
    var dealID: UUID
    var roiPercentage: Double
    var date: Date
}
