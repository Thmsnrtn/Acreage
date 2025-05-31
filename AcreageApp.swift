//
//  AcreageApp.swift
//  Acreage
//
//  Created by Tom on 5/30/25.
//

import SwiftUI

@main
struct AcreageApp: App {
    @StateObject private var sessionManager = SessionManager.shared
    @StateObject private var userPreferences = UserPreferences()
    @StateObject private var pluginManager = PluginManagerSwift()
    @StateObject private var automationEngine = AutomationEngine()
    @StateObject private var navigationModel = NavigationModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(sessionManager)
                .environmentObject(userPreferences)
                .environmentObject(pluginManager)
                .environmentObject(automationEngine)
                .environmentObject(navigationModel)
                .onAppear {
                    AIChatEngine.shared.logLaunch()
                    PersistenceManager.shared.loadInitialData()
                }
        }
    }
}
