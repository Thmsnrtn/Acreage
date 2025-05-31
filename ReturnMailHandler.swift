//
//  ReturnMailHandler.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

class ReturnMailHandler {
    static let shared = ReturnMailHandler()

    func processScannedMail(_ scannedMail: ScannedMail) {
        // Example logic: detect return reasons and route to CRM
        if scannedMail.content.lowercased().contains("undeliverable") {
            print("Detected undeliverable mail — route to CRM for address verification.")
            // You could invoke CRMManager.shared.flagLead(leadID)
        }
    }
}

struct ScannedMail: Identifiable, Codable {
    var id: UUID
    var imageUrl: String
    var content: String
    var receivedDate: Date
}
