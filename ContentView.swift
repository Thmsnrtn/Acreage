//
//  ContentView.swift
//  Acreage
//
//  Created by Tom on 5/30/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var sessionManager: SessionManager

    var body: some View {
        Group {
            if sessionManager.isLoggedIn {
                DashboardView()
            } else {
                LoginView()
            }
        }
        .frame(minWidth: 800, minHeight: 600)
    }
}
