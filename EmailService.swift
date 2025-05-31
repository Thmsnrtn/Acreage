//
//  EmailService.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

class EmailService {
    static let shared = EmailService()

    func sendEmail(to recipient: String, subject: String, body: String, completion: @escaping (Bool) -> Void) {
        print("Sending email to \(recipient) with subject: \(subject)")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            completion(true)
        }
    }
}
