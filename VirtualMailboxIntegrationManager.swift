//
//  VirtualMailboxIntegrationManager.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

class VirtualMailboxIntegrationManager {
    static let shared = VirtualMailboxIntegrationManager()

    private init() {}

    func processIncomingMail(_ scannedMail: ScannedMailItem) -> MailActionResult {
        let assistantAnalysis = AssistantMailClassifier.shared.analyze(mail: scannedMail)

        switch assistantAnalysis.type {
        case .offerAccepted:
            return .init(action: .startClosing, notes: "Offer accepted, begin closing sequence.")
        case .offerRejected:
            return .init(action: .archive, notes: "Offer rejected, archiving response.")
        case .inquiry:
            return .init(action: .respond, notes: "Buyer inquiry — escalate to assistant conversation.")
        case .undetermined:
            return .init(action: .manualReview, notes: "Content unclear. Recommend user review.")
        }
    }
}

struct ScannedMailItem {
    let id: UUID
    let content: String
    let scannedDate: Date
}

struct MailActionResult {
    let action: MailAction
    let notes: String
}

enum MailAction {
    case startClosing
    case respond
    case archive
    case manualReview
}
