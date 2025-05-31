//
//  AssistantMailClassifier.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

class AssistantMailClassifier {
    static let shared = AssistantMailClassifier()

    private init() {}

    func analyze(mail: ScannedMailItem) -> MailClassification {
        let content = mail.content.lowercased()

        if content.contains("i accept") || content.contains("let's proceed") {
            return .init(type: .offerAccepted)
        } else if content.contains("not interested") || content.contains("decline") {
            return .init(type: .offerRejected)
        } else if content.contains("tell me more") || content.contains("interested") {
            return .init(type: .inquiry)
        } else {
            return .init(type: .undetermined)
        }
    }
}

struct MailClassification {
    let type: MailContentType
}

enum MailContentType {
    case offerAccepted, offerRejected, inquiry, undetermined
}
