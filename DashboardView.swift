//
//  DashboardView.swift
//  Acreage
//
//  Created by Tom on 5/30/25.
//

import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var sessionManager: SessionManager

    var body: some View {
        NavigationView {
            SidebarView()
            Text("Select an item from the sidebar.")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
