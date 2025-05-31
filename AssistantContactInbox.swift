//
//  Untitled.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

class AssistantContactInbox: ObservableObject {
    static let shared = AssistantContactInbox()

    @Published var inboxItems: [InboundMessage] = []

    private init() {}

    func receive(message: InboundMessage) {
        inboxItems.append(message)
        classify(message)
    }

    private func classify(_ message: InboundMessage) {
        let lower = message.body.lowercased()
        if lower.contains("interested") {
            print("Classified as buyer lead")
        } else if lower.contains("sell") {
            print("Classified as seller lead")
        } else {
            print("Needs manual review")
        }
    }
}

struct InboundMessage: Identifiable {
    let id = UUID()
    let source: ContactSource
    let body: String
    let timestamp: Date
}

enum ContactSource {
    case email, voicemail, virtualMailbox
}
