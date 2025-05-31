//
//  MailAction.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

enum MailAction {
    case resendToUpdatedAddress(String)
    case markAsComplete
    case flagForManualReview
}
