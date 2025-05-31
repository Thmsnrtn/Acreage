//
//  Click2MailService.swift
//  Acreage
//
//  Created by Tom on 5/30/25.
//

import Foundation

class Click2MailService {
    static let shared = Click2MailService()

    func sendLetter(recipientAddress: String, pdfData: Data, completion: @escaping (Bool) -> Void) {
        // Simulate sending a letter via API — replace with actual Click2Mail logic
        print("Sending letter to \(recipientAddress) via Click2Mail...")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            completion(true)
        }
    }
}
