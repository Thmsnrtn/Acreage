//
//  PropertySelectionView.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import SwiftUI

struct PropertySelectionView: View {
    @ObservedObject var lead: Lead
    @Environment(\.dismiss) var dismiss
    @State private var selectedProperty: Property?

    var body: some View {
        NavigationView {
            List {
                ForEach(PortfolioManager.shared.properties) { property in
                    Button(action: {
                        self.selectedProperty = property
                    }) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(property.apn)
                                Text("\(property.county), \(property.state)")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            Spacer()
                            if selectedProperty?.id == property.id {
                                Image(systemName: "checkmark")
                            }
                        }
                    }
                }
            }
            .navigationTitle("Select Property")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Link") {
                        if let selected = selectedProperty {
                            lead.linkedPropertyID = selected.id
                        }
                        dismiss()
                    }
                    .disabled(selectedProperty == nil)
                }
            }
        }
    }
}
