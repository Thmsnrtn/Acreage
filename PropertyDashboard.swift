//
//  PropertyDashboard.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import SwiftUI

struct PropertyDashboard: View {
    @ObservedObject var portfolioManager = PortfolioManager.shared

    var body: some View {
        VStack(alignment: .leading) {
            Text("Portfolio Overview")
                .font(.title)
                .bold()

            HStack {
                StatBox(title: "Total Properties", value: "\(portfolioManager.properties.count)")
                StatBox(title: "In Portfolio", value: "\(portfolioManager.properties.filter { $0.status == .inPortfolio }.count)")
                StatBox(title: "Sold", value: "\(portfolioManager.properties.filter { $0.status == .sold }.count)")
            }

            List {
                ForEach(portfolioManager.properties) { property in
                    PropertyCard(property: property)
                }
            }
        }
        .padding()
    }
}

struct StatBox: View {
    var title: String
    var value: String

    var body: some View {
        VStack {
            Text(value)
                .font(.title)
                .bold()
            Text(title)
                .font(.caption)
        }
        .frame(width: 120, height: 80)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
    }
}
