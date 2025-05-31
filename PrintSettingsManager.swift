//
//  PrintSettingsManager.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

class PrintSettingsManager: ObservableObject {
    static let shared = PrintSettingsManager()

    @Published var settings: PrintSettings

    private init() {
        if let data = UserDefaults.standard.data(forKey: "printSettings"),
           let decoded = try? JSONDecoder().decode(PrintSettings.self, from: data) {
            settings = decoded
        } else {
            settings = PrintSettings(includeMailingLabels: true, pageSize: "Letter", margin: 0.5)
        }
    }

    func save() {
        if let encoded = try? JSONEncoder().encode(settings) {
            UserDefaults.standard.set(encoded, forKey: "printSettings")
        }
    }
}
