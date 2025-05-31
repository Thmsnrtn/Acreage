//
//  AssistantStrategicPlanner.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//
import Foundation

class AssistantStrategicPlanner {
    static let shared = AssistantStrategicPlanner()

    struct AssistantGoal {
        let id = UUID()
        let title: String
        let priority: Int
        let deadline: Date?
        let context: String
    }

    private(set) var activeGoals: [AssistantGoal] = []

    func addGoal(title: String, priority: Int = 1, deadline: Date? = nil, context: String = "General") {
        let newGoal = AssistantGoal(title: title, priority: priority, deadline: deadline, context: context)
        activeGoals.append(newGoal)
        AssistantMemoryEngine.shared.record(action: "Created Goal", context: title)
    }

    func generateSuggestedNextSteps(for context: String) -> [String] {
        switch context {
        case "Leads":
            return ["Review new leads", "Send offer letters", "Run due diligence"]
        case "Marketing":
            return ["Launch new campaign", "Analyze response rates", "Send neighbor letter batch"]
        case "Portfolio":
            return ["List properties for sale", "Review tax payment deadlines", "Optimize ROI"]
        default:
            return ["No context-specific suggestions available."]
        }
    }

    func scheduleWorkflows() {
        for goal in activeGoals {
            AssistantMemoryEngine.shared.record(action: "Scheduled", context: goal.title)
        }
    }

    func clearCompletedGoals() {
        activeGoals.removeAll()
        AssistantMemoryEngine.shared.record(action: "Cleared", context: "All Goals")
    }
}
