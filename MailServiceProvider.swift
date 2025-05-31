//
//  MailServiceProvider.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//
import Foundation

enum MailServiceProvider: String, CaseIterable, Identifiable, Codable {
    case click2mail = "Click2Mail"
    case lob = "Lob"
    case postGrid = "PostGrid"
    case postalMethods = "PostalMethods"
    
    var id: String { self.rawValue }

    var apiEndpoint: String {
        switch self {
        case .click2mail:
            return "https://rest.click2mail.com"
        case .lob:
            return "https://api.lob.com"
        case .postGrid:
            return "https://api.postgrid.com"
        case .postalMethods:
            return "https://api.postalmethods.com"
        }
    }

    var supportsAPI: Bool {
        return true
    }
}
