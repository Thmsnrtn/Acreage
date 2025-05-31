//
//  PrintFormat.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

enum PrintFormat: String, CaseIterable, Identifiable, Codable {
    case letter
    case postcard
    case labelSheet

    var id: String { self.rawValue }

    var description: String {
        switch self {
        case .letter: return "Standard Letter"
        case .postcard: return "Postcard"
        case .labelSheet: return "Mailing Label Sheet"
        }
    }
}
