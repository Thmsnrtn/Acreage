//
//  ResellerInfo.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

struct ResellerInfo: Codable, Identifiable {
    var id: UUID
    var companyName: String
    var contactEmail: String
    var phoneNumber: String
    var licenseNumber: String
}
