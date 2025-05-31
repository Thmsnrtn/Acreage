//
//  VirtualMailboxManager.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//
//
//  VirtualMailboxManager.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

class VirtualMailboxManager: ObservableObject {
    static let shared = VirtualMailboxManager()
    
    @Published var scannedMail: [ScannedMailItem] = []
    @Published var services: [VirtualMailboxService] = []
    @Published var selectedService: VirtualMailboxService?

    private var mailProcessingEngine: MailProcessingEngine

    private init() {
        self.mailProcessingEngine = MailProcessingEngine()
        loadAvailableServices()
        loadScannedMail()
    }

    func loadAvailableServices() {
        services = [
            VirtualMailboxService(name: "PostScan Mail", apiEndpoint: "https://api.postscanmail.com"),
            VirtualMailboxService(name: "Anytime Mailbox", apiEndpoint: "https://api.anytimemailbox.com"),
            VirtualMailboxService(name: "iPostal1", apiEndpoint: "https://api.ipostal1.com")
        ]
        selectedService = services.first
    }

    func loadScannedMail() {
        // Simulate loading of scanned mail items
        scannedMail = [
            ScannedMailItem(
                id: UUID(),
                sender: "County Tax Office",
                subject: "Tax Notice",
                content: "You owe back taxes on Parcel 123-456.",
                receivedDate: Date()
            ),
            ScannedMailItem(
                id: UUID(),
                sender: "Return Mail",
                subject: "Undeliverable Offer",
                content: "Mail to John Smith returned. Address not found.",
                receivedDate: Date()
            )
        ]
    }

    func processIncomingMail() {
        for mail in scannedMail {
            let action = mailProcessingEngine.analyze(mail: mail)
            perform(action: action, for: mail)
        }
    }

    func perform(action: MailAction, for mail: ScannedMailItem) {
        switch action {
        case .resendToUpdatedAddress(let newAddress):
            print("Resending mail to new address: \(newAddress)")
            MailCampaignEngine.shared.resendMail(for: mail, to: newAddress)

        case .markAsComplete:
            print("Marking mail as resolved.")
            if let index = scannedMail.firstIndex(where: { $0.id == mail.id }) {
                scannedMail.remove(at: index)
            }

        case .flagForManualReview:
            print("Flagged for manual review: \(mail.subject)")
            AssistantContextManager.shared.logUncategorizedMail(mail)
        }
    }

    func fetchScannedMail(from service: VirtualMailboxService) {
        // This would connect to a virtual mailbox provider via API
        print("Fetching mail from: \(service.name)")
        // Future: integrate OAuth + webhook + polling API support here
    }
}
