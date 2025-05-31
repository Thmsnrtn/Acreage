//
//  TaxManager.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

class TaxManager: ObservableObject {
    @Published var taxBills: [TaxBill] = []

    func loadTaxBills() {
        // Placeholder logic to fetch or simulate tax bills
        taxBills = [
            TaxBill(id: UUID(), propertyID: UUID(), amountDue: 328.52, dueDate: Date().addingTimeInterval(86400 * 30), paymentLink: "https://county.gov/pay", isPaid: false)
        ]
    }

    func markAsPaid(_ bill: TaxBill) {
        if let index = taxBills.firstIndex(where: { $0.id == bill.id }) {
            taxBills[index].isPaid = true
        }
    }

    func getUnpaidBills() -> [TaxBill] {
        return taxBills.filter { !$0.isPaid }
    }
}
