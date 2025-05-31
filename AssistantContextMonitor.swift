//
//  AssistantContextMonitor.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

class AssistantContextMonitor: ObservableObject {
    static let shared = AssistantContextMonitor()

    @Published var currentContext: String = "Idle"

    func observe(viewName: String) {
        currentContext = "Viewing \(viewName)"
        AssistantMemoryEngine.shared.record(action: "Viewed", context: viewName)
    }

    func observeAction(_ action: String, context: String) {
        currentContext = "\(action) in \(context)"
        AssistantMemoryEngine.shared.record(action: action, context: context)
    }
}
