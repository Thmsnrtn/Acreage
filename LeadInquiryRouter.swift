//
//   LeadInquiryRouter.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

class LeadInquiryRouter {
    static let shared = LeadInquiryRouter()

    private init() {}

    func routeInquiry(from source: InquirySource, content: String) -> InquiryAction {
        let lowerContent = content.lowercased()

        if lowerContent.contains("interested") || lowerContent.contains("buy") {
            return .init(action: .scheduleCall, note: "Buyer lead identified.")
        } else if lowerContent.contains("sell") || lowerContent.contains("land") {
            return .init(action: .evaluateLead, note: "Seller inquiry recognized.")
        } else {
            return .init(action: .manualReview, note: "Unclassified inquiry.")
        }
    }
}

enum InquirySource {
    case email, scannedMail
}

struct InquiryAction {
    let action: InquiryResponse
    let note: String
}

enum InquiryResponse {
    case scheduleCall, evaluateLead, manualReview
}
