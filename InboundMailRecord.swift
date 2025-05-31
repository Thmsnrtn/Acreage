//
//  InboundMailRecord.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

struct InboundMailRecord: Identifiable, Codable {
    var id = UUID()
    var providerId: UUID
    var scannedImageURL: URL
    var receivedDate: Date
    var actionStatus: MailActionStatus

    enum MailActionStatus: String, Codable, CaseIterable {
        case unread
        case archived
        case resendInitiated
        case trash
    }
}
