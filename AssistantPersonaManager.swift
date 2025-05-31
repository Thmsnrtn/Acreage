//
//  AssistantPersonaManager.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

class AssistantPersonaManager: ObservableObject {
    static let shared = AssistantPersonaManager()

    @Published var activePersona: AssistantPersona = .defaultPersona
    private let key = "activeAssistantPersona"

    private init() {
        loadPersona()
    }

    func loadPersona() {
        if let data = UserDefaults.standard.data(forKey: key),
           let persona = try? JSONDecoder().decode(AssistantPersona.self, from: data) {
            self.activePersona = persona
        }
    }

    func savePersona() {
        if let data = try? JSONEncoder().encode(activePersona) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }

    func updatePersona(to newPersona: AssistantPersona) {
        self.activePersona = newPersona
        savePersona()
    }
}
