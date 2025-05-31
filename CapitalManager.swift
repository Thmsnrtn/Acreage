//
//  Untitled.swift
//  Acreage
//
//  Created by Tom on 5/30/25.
//
import Foundation

class CapitalManager: ObservableObject {
    static let shared = CapitalManager()

    @Published var allProperties: [Property] = []
    @Published var transactions: [CapitalTransaction] = []

    private init() {}

    // MARK: - Capital Management

    func allocateFunds(to property: Property, amount: Double) {
        guard let index = allProperties.firstIndex(where: { $0.id == property.id }) else { return }
        allProperties[index].allocatedFunds += amount
        let transaction = CapitalTransaction(propertyID: property.id, amount: amount, type: .allocation, timestamp: Date())
        transactions.append(transaction)
    }

    func recordTransaction(for property: Property, amount: Double, type: TransactionType) {
        let transaction = CapitalTransaction(propertyID: property.id, amount: amount, type: type, timestamp: Date())
        transactions.append(transaction)
    }

    func propertiesWithTaxesDue() -> [Property] {
        allProperties.filter { ($0.backTaxesAmount ?? 0) > 0 }
    }

    // MARK: - Manual Overrides & Assistant Context

    func registerManualAction(propertyID: UUID, action: String) {
        print("Manual override for property \(propertyID): \(action)")
        // This feeds assistant workflow contextual logic
    }
}

// MARK: - Supporting Models

struct CapitalTransaction: Identifiable {
    let id = UUID()
    let propertyID: UUID
    let amount: Double
    let type: TransactionType
    let timestamp: Date
}

enum TransactionType: String, Codable {
    case allocation
    case payment
    case acquisition
    case tax
}
