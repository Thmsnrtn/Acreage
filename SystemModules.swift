//
//  SystemModules.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//
import Foundation

enum SystemModule: String, Codable, CaseIterable {
    case assistant
    case crm
    case campaignEngine
    case documentGenerator
    case deedAutomation
    case dueDiligence
    case taxManager
    case capitalManager
    case workflowEngine
    case virtualMailbox
}

class SystemModules: ObservableObject {
    static let shared = SystemModules()

    @Published var enabledModules: Set<SystemModule> = Set(SystemModule.allCases)

    func isEnabled(_ module: SystemModule) -> Bool {
        return enabledModules.contains(module)
    }

    func toggleModule(_ module: SystemModule) {
        if enabledModules.contains(module) {
            enabledModules.remove(module)
        } else {
            enabledModules.insert(module)
        }
    }
}
