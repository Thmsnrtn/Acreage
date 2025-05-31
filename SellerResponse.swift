//
//  SellerResponse.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

struct SellerResponse: Identifiable, Codable {
    var id = UUID()
    var leadID: UUID
    var responseDate: Date
    var responseType: SellerResponseType
    var notes: String
}

enum SellerResponseType: String, Codable, CaseIterable {
    case accepted
    case rejected
    case countered
    case requestedMoreInfo
    case unreachable
}
