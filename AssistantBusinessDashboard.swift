//
//  AssistantBusinessDashboard.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

struct DashboardMetric: Identifiable, Codable {
    let id = UUID()
    let title: String
    let value: String
    let trend: String
}

class AssistantBusinessDashboard: ObservableObject {
    static let shared = AssistantBusinessDashboard()

    @Published var metrics: [DashboardMetric] = []

    func refreshMetrics() {
        metrics = [
            DashboardMetric(title: "Active Leads", value: "42", trend: "↑ 8%"),
            DashboardMetric(title: "Pending Offers", value: "19", trend: "→ Stable"),
            DashboardMetric(title: "Closed Sales", value: "7", trend: "↑ 2%"),
            DashboardMetric(title: "Avg ROI", value: "148%", trend: "↑ 5%")
        ]
    }

    func metric(forTitle title: String) -> DashboardMetric? {
        return metrics.first(where: { $0.title == title })
    }
}
