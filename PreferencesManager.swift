//
//  PreferencesManager.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

class PreferencesManager: ObservableObject {
    static let shared = PreferencesManager()

    @Published var preferences: Preferences

    private init() {
        if let data = UserDefaults.standard.data(forKey: "preferences"),
           let decoded = try? JSONDecoder().decode(Preferences.self, from: data) {
            preferences = decoded
        } else {
            preferences = Preferences(
                defaultOfferAmount: 1000,
                autoSendOffers: true,
                autoPayTaxes: false,
                preferredMailService: "Click2Mail",
                assistantApprovalRequired: true
            )
        }
    }

    func save() {
        if let encoded = try? JSONEncoder().encode(preferences) {
            UserDefaults.standard.set(encoded, forKey: "preferences")
        }
    }
}
