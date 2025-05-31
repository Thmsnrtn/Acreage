//
//  MailingLabelFormatter.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

struct MailingLabel {
    var name: String
    var address: String
    var city: String
    var state: String
    var zip: String

    var formatted: String {
        """
        \(name)
        \(address)
        \(city), \(state) \(zip)
        """
    }
}

class MailingLabelFormatter {
    static func generateLabels(from leads: [Lead]) -> [MailingLabel] {
        return leads.map {
            MailingLabel(
                name: "\($0.firstName) \($0.lastName)",
                address: $0.mailingAddress,
                city: $0.city,
                state: $0.state,
                zip: $0.zipCode
            )
        }
    }

    static func exportLabelsPDF(labels: [MailingLabel]) -> URL? {
        let content = labels.map { $0.formatted }.joined(separator: "\n\n")
        return PDFExporter.export(content: content, fileName: "MailingLabels")
    }
}
