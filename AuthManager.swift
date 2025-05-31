//
//  AuthManager.swift
//  Acreage
//
//  Created by Tom on 5/30/25.
//

import Foundation

class AuthManager: ObservableObject {
    static let shared = AuthManager()
    
    @Published var isAuthenticated = false
    @Published var userEmail: String?

    private init() {}

    func login(email: String, password: String) {
        // Stubbed logic; replace with real authentication
        isAuthenticated = true
        userEmail = email
    }

    func logout() {
        isAuthenticated = false
        userEmail = nil
    }
}
