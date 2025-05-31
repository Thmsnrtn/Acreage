//
//  Assistant.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

/// Defines possible commands the assistant can execute in response to user interaction or autonomous triggers.
enum AssistantCommand {
    case generateOfferLetter(Lead)
    case sendNeighborLetter(Property)
    case uploadToMarketplace(Property)
    case payTaxes(Property)
    case logNote(String, context: String)
    case runDueDiligence(Property)
    case notifyUser(String)
}
