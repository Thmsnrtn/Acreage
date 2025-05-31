import Foundation

class CapitalTaxPaymentHandler {
    static let shared = CapitalTaxPaymentHandler()
    
    private init() {}

    func processTaxPayments(for properties: [Property]) -> [TaxPaymentLink] {
        return properties.compactMap { property in
            guard let taxURL = property.taxPaymentURL else { return nil }
            return TaxPaymentLink(propertyID: property.id, url: taxURL)
        }
    }
}

struct TaxPaymentLink {
    let propertyID: UUID
    let url: URL
}
