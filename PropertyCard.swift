//
//  PropertyCard.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import SwiftUI

struct PropertyCard: View {
    var property: Property

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("\(property.apn) - \(property.county), \(property.state)")
                .font(.headline)
            Text("Acreage: \(property.acreage, specifier: "%.2f")")
            Text("Status: \(property.status.rawValue)")
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
    }
}
