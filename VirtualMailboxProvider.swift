//
//  VirtualMailboxProvider.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

struct VirtualMailboxProvider: Identifiable, Codable {
    var id = UUID()
    var name: String
    var dashboardURL: URL
    var apiEndpoint: URL?
    var apiKey: String?
    var webhookSupported: Bool
}
