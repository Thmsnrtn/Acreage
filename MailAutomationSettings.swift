//
//  MailAutomationSettings.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

class MailAutomationSettings: ObservableObject, Codable {
    @Published var selectedProvider: MailServiceProvider = .click2mail
    @Published var autoSendWithoutReview: Bool = false
    @Published var defaultPrintFormat: PrintFormat = .letter

    enum CodingKeys: CodingKey {
        case selectedProvider, autoSendWithoutReview, defaultPrintFormat
    }

    init() {}

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        selectedProvider = try container.decode(MailServiceProvider.self, forKey: .selectedProvider)
        autoSendWithoutReview = try container.decode(Bool.self, forKey: .autoSendWithoutReview)
        defaultPrintFormat = try container.decode(PrintFormat.self, forKey: .defaultPrintFormat)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(selectedProvider, forKey: .selectedProvider)
        try container.encode(autoSendWithoutReview, forKey: .autoSendWithoutReview)
        try container.encode(defaultPrintFormat, forKey: .defaultPrintFormat)
    }
}
