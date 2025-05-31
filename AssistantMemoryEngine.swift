//
//  AssistantMemoryEngine.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//
import Foundation

class AssistantMemoryEngine {
    static let shared = AssistantMemoryEngine()

    struct MemoryEntry: Identifiable {
        let id = UUID()
        let timestamp: Date
        let context: String
        let action: String
    }

    private(set) var memoryLog: [MemoryEntry] = []
    private let memoryLimit = 1000  // Prevent unbounded memory growth

    private init() {}

    func record(action: String, context: String) {
        let entry = MemoryEntry(timestamp: Date(), context: context, action: action)
        memoryLog.append(entry)

        if memoryLog.count > memoryLimit {
            memoryLog.removeFirst()
        }
    }

    func recentContextSummary(limit: Int = 10) -> [String] {
        let recent = memoryLog.suffix(limit)
        return recent.map { "[\($0.timestamp)] \($0.context): \($0.action)" }
    }

    func getContext(for keyword: String) -> [MemoryEntry] {
        return memoryLog.filter { $0.context.localizedCaseInsensitiveContains(keyword) || $0.action.localizedCaseInsensitiveContains(keyword) }
    }

    func clearMemory() {
        memoryLog.removeAll()
    }

    func summarizeContext(for module: String) -> String {
        let entries = getContext(for: module)
        let recentActions = entries.suffix(5).map { $0.action }
        return recentActions.joined(separator: ", ")
    }

    func exportMemoryLog() -> String {
        memoryLog.map { "\($0.timestamp), \($0.context), \($0.action)" }
            .joined(separator: "\n")
    }
}
