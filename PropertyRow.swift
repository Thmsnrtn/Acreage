//
//  PropertyRow.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import SwiftUI

struct PropertyRow: View {
    var property: Property

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(property.apn).bold()
                Text("\(property.county), \(property.state)")
                    .font(.subheadline)
            }
            Spacer()
            Text(property.status.rawValue)
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }
}
