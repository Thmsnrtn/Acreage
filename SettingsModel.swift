//
//  SettingsModel.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

class SettingsModel: ObservableObject {
    @Published var reviewBeforeSending: Bool = true
    @Published var selectedMailProvider: MailProvider = .click2mail
    @Published var automationLevel: AutomationLevel = .semiAuto
}

enum MailProvider: String, Codable, CaseIterable {
    case click2mail, lob, postGrid, postalMethods
}

enum AutomationLevel: String, Codable, CaseIterable {
    case manual, semiAuto, fullAuto
}
