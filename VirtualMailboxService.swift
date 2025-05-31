//
//  VirtualMailboxService.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

struct VirtualMailboxService: Identifiable, Codable, Equatable {
    let id = UUID()
    let name: String
    let apiEndpoint: String
}
