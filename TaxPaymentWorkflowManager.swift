//
//  TaxPaymentWorkflowManager.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

class TaxPaymentWorkflowManager {
    static let shared = TaxPaymentWorkflowManager()

    private init() {}

    func generateTaxPaymentLink(for property: Property) -> URL? {
        return property.taxPortalURL
    }

    func shouldSchedulePayment(for property: Property) -> Bool {
        return property.backTaxesAmount ?? 0 > 0
    }

    func recordTaxPayment(for property: Property, amount: Double, date: Date) {
        print("Payment recorded: \(amount) on \(date) for \(property.id)")
        // Integrate with database ledger here
    }
}
