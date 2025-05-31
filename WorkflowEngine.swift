//
//  WorkflowEngine.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

enum WorkflowType: String, Codable {
    case acquisition
    case dueDiligence
    case marketing
    case disposition
    case taxManagement
    case capitalAllocation
}

struct WorkflowState: Codable {
    var currentStep: String
    var status: String
    var lastUpdated: Date
}

class WorkflowEngine: ObservableObject {
    @Published var activeWorkflows: [WorkflowType: WorkflowState] = [:]

    func updateWorkflow(_ type: WorkflowType, step: String, status: String) {
        let newState = WorkflowState(currentStep: step, status: status, lastUpdated: Date())
        activeWorkflows[type] = newState
    }

    func getWorkflowState(_ type: WorkflowType) -> WorkflowState? {
        return activeWorkflows[type]
    }

    func resetWorkflow(_ type: WorkflowType) {
        activeWorkflows[type] = nil
    }
}
