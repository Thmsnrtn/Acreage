//
//  MailIntegrationAPI.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

class MailIntegrationAPI {
    static func sendDocument(url: URL, to lead: Lead, via provider: MailServiceProvider, completion: @escaping (Result<String, Error>) -> Void) {
        // Stubbed logic for external API interaction
        // Replace with real provider-specific API integration
        print("Sending document at \(url) to \(lead.firstName) via \(provider.rawValue)...")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion(.success("Mail sent via \(provider.rawValue)"))
        }
    }
}
