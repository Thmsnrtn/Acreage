//
//  ReferralManager.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

class ReferralManager: ObservableObject {
    static let shared = ReferralManager()

    @Published var referrals: [Referral] = []

    func addReferral(_ referral: Referral) {
        referrals.append(referral)
    }

    func removeReferral(_ referral: Referral) {
        referrals.removeAll { $0.id == referral.id }
    }

    func loadSampleData() {
        referrals = [
            Referral(id: UUID(), name: "John Doe", email: "john@example.com", referredDate: Date()),
            Referral(id: UUID(), name: "Jane Smith", email: "jane@example.com", referredDate: Date())
        ]
    }
}

struct Referral: Identifiable, Codable {
    var id: UUID
    var name: String
    var email: String
    var referredDate: Date
}
