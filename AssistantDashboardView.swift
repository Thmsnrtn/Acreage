//
//  AssistantDashboardView.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import SwiftUI

struct AssistantDashboardView: View {
    @ObservedObject var dashboard = AssistantBusinessDashboard.shared

    var body: some View {
        VStack(alignment: .leading) {
            Text("Business Intelligence").font(.title2).bold().padding(.bottom)
            ForEach(dashboard.metrics) { metric in
                HStack {
                    VStack(alignment: .leading) {
                        Text(metric.title).font(.headline)
                        Text(metric.trend).font(.caption).foregroundColor(.gray)
                    }
                    Spacer()
                    Text(metric.value).font(.title2)
                }
                Divider()
            }
        }
        .padding()
        .onAppear {
            dashboard.refreshMetrics()
        }
    }
}
