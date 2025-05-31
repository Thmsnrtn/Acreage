//
//  AssistantSettingsView.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import SwiftUI

struct AssistantSettingsView: View {
    @ObservedObject var toggles = AssistantAutomationToggles.shared

    var body: some View {
        Form {
            Section(header: Text("Automation Preferences")) {
                ForEach(toggles.toggles.indices, id: \.self) { index in
                    Toggle(isOn: $toggles.toggles[index].isEnabled) {
                        VStack(alignment: .leading) {
                            Text(toggles.toggles[index].title)
                                .font(.headline)
                            Text(toggles.toggles[index].description)
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
        }
        .navigationTitle("Assistant Settings")
        .padding()
    }
}
