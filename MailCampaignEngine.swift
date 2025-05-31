//
//  MailCampaignEngine.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

class MailCampaignEngine {
    static func submitMail(for lead: Lead, using template: DocumentTemplate, settings: MailAutomationSettings, completion: @escaping (Result<String, Error>) -> Void) {
        guard let documentURL = PrintUtilities.exportDocument(ofType: template.type, for: lead, templateManager: DocumentTemplateManager.shared) else {
            completion(.failure(NSError(domain: "MailCampaignEngine", code: 404, userInfo: [NSLocalizedDescriptionKey: "Document export failed."])))
            return
        }

        if settings.autoSendWithoutReview {
            MailIntegrationAPI.sendDocument(url: documentURL, to: lead, via: settings.selectedProvider, completion: completion)
        } else {
            // Review flow would occur in UI
            completion(.success("Document ready for review before mailing."))
        }
    }
}
