//
//  AutomationSettingsManager.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//
import Foundation

/// Manages reading/writing the user's automation settings for Acreage.
class AutomationSettingsManager: ObservableObject {
    static let shared = AutomationSettingsManager()

    @Published var settings: AutomationSettings = AutomationSettings()

    private let settingsKey = "automationSettings"

    private init() {
        loadSettings()
    }

    func loadSettings() {
        if let data = UserDefaults.standard.data(forKey: settingsKey),
           let loaded = try? JSONDecoder().decode(AutomationSettings.self, from: data) {
            settings = loaded
        }
    }

    func saveSettings() {
        if let data = try? JSONEncoder().encode(settings) {
            UserDefaults.standard.set(data, forKey: settingsKey)
        }
    }

    func toggle(_ keyPath: WritableKeyPath<AutomationSettings, Bool>) {
        settings[keyPath: keyPath].toggle()
        saveSettings()
    }

    func resetToDefaults() {
        settings = AutomationSettings()
        saveSettings()
    }
}
