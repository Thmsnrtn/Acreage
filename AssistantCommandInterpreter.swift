//
//  AssistantCommandInterpreter.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//
import Foundation

class AssistantCommandInterpreter {
    static func interpret(_ input: String) -> AssistantCommand? {
        let trimmed = input.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        if trimmed.contains("generate offer") || trimmed.contains("write offer letter") {
            return .generateOfferLetter
        } else if trimmed.contains("show leads") {
            return .showLeads
        } else if trimmed.contains("show portfolio") {
            return .showPortfolio
        } else if trimmed.contains("due diligence") {
            return .runDueDiligence
        }
        return nil
    }
}

enum AssistantCommand {
    case generateOfferLetter
    case showLeads
    case showPortfolio
    case runDueDiligence
}
