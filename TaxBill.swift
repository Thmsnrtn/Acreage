//
//  TaxBill.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

struct TaxBill: Identifiable, Codable {
    var id: UUID
    var propertyID: UUID
    var amountDue: Double
    var dueDate: Date
    var paymentLink: String
    var isPaid: Bool
}
