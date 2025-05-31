//
//  ContactHandler.swift
//  Acreage
//
//  Created by Tom on 5/30/25.
//

import Foundation

class ContactHandler {
    static let shared = ContactHandler()

    func handleIncomingMessage(from: String, subject: String, body: String) {
        print("Message received from \(from): \(subject) — \(body)")
        // In future: route to AI assistant or alert the user
    }
}
