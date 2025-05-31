//
//  TemplateLibrary.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//
import Foundation

enum TemplateType: String, Codable, CaseIterable, Identifiable {
    case offerLetter = "Offer Letter"
    case purchaseAgreement = "Purchase & Sale Agreement"
    case quitclaimDeed = "Quitclaim Deed"
    case neighborLetter = "Neighbor Letter"
    case dueDiligenceChecklist = "Due Diligence Checklist"

    var id: String { rawValue }

    var filename: String {
        switch self {
        case .offerLetter:
            return "Offer Letter Template.txt"
        case .purchaseAgreement:
            return "Purchase And Sale Agreement Template.txt"
        case .quitclaimDeed:
            return "Quitclaim Deed Template.txt"
        case .neighborLetter:
            return "Neighbor-Letter__1_.docx"
        case .dueDiligenceChecklist:
            return "Due-Diligence-Property-Worksheet.xlsx"
        }
    }

    var fileExtension: String {
        switch self {
        case .neighborLetter:
            return "docx"
        case .dueDiligenceChecklist:
            return "xlsx"
        default:
            return "txt"
        }
    }

    var fileDescription: String {
        switch self {
        case .offerLetter:
            return "Used to send purchase offers to landowners."
        case .purchaseAgreement:
            return "Legal contract for buying/selling land."
        case .quitclaimDeed:
            return "Transfer document to convey property ownership."
        case .neighborLetter:
            return "Outbound letter offering land to neighboring owners."
        case .dueDiligenceChecklist:
            return "Internal checklist for vetting land opportunities."
        }
    }
}

class TemplateLibrary {
    static let shared = TemplateLibrary()

    private init() {}

    func url(for template: TemplateType) -> URL? {
        Bundle.main.url(forResource: template.filename.replacingOccurrences(of: ".\(template.fileExtension)", with: ""), withExtension: template.fileExtension)
    }

    func contents(for template: TemplateType) -> String? {
        guard let url = url(for: template) else { return nil }
        do {
            if template.fileExtension == "txt" {
                return try String(contentsOf: url)
            } else {
                return "[Non-text template: \(template.filename)]"
            }
        } catch {
            print("Error loading template \(template.filename): \(error)")
            return nil
        }
    }

    func allAvailableTemplates() -> [TemplateType] {
        return TemplateType.allCases
    }

    func description(for template: TemplateType) -> String {
        return template.fileDescription
    }
}
