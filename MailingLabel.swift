//
//  MailingLabel.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

struct MailingLabel: Identifiable, Codable {
    var id = UUID()
    var recipientName: String
    var address: String
    var city: String
    var state: String
    var zip: String
}
