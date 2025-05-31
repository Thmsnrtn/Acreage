//
//  AssistantExecutionEngine.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//
import Foundation

/// Responsible for executing assistant-generated actions after interpretation.
class AssistantExecutionEngine {
    static let shared = AssistantExecutionEngine()

    private init() {}

    func execute(_ command: AssistantCommand) {
        switch command {
        case .generateOfferLetter(let lead):
            OfferLetterGenerator.shared.generate(for: lead)
        case .sendNeighborLetter(let property):
            MailCampaignEngine.shared.sendNeighborLetter(for: property)
        case .uploadToMarketplace(let property):
            DispositionEngine.shared.upload(property)
        case .payTaxes(let property):
            CapitalManagementEngine.shared.payTaxes(for: property)
        case .logNote(let text, let context):
            AssistantMemoryEngine.shared.logNote(text, context: context)
        case .runDueDiligence(let property):
            DueDiligenceEngine.shared.runChecks(on: property)
        case .notifyUser(let message):
            NotificationCenter.default.post(name: .assistantNotification, object: message)
        }
    }
}
