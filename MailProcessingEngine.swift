//
//  MailProcessingEngine.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

class MailProcessingEngine {
    func analyze(mail: ScannedMailItem) -> MailAction {
        // Placeholder logic — you can evolve this with GPT/LLM integration
        if mail.subject.lowercased().contains("undeliverable") {
            return .resendToUpdatedAddress("New Address Placeholder")
        } else if mail.subject.lowercased().contains("tax") {
            return .flagForManualReview
        } else {
            return .markAsComplete
        }
    }
}
