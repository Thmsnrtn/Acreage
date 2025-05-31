//
//  RefundManager.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

class RefundManager: ObservableObject {
    static let shared = RefundManager()

    @Published var refunds: [Refund] = []

    func processRefund(for id: UUID, amount: Double, reason: String) {
        let refund = Refund(id: UUID(), originalTransactionID: id, amount: amount, date: Date(), reason: reason)
        refunds.append(refund)
    }

    func allRefunds() -> [Refund] {
        return refunds
    }
}

struct Refund: Identifiable, Codable {
    var id: UUID
    var originalTransactionID: UUID
    var amount: Double
    var date: Date
    var reason: String
}
