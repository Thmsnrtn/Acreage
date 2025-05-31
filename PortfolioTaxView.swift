//
//  PortfolioTaxView.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import SwiftUI

struct PortfolioTaxView: View {
    @ObservedObject var portfolioManager = CapitalPortfolioManager.shared

    var body: some View {
        List {
            ForEach(portfolioManager.propertiesWithTaxesDue()) { property in
                VStack(alignment: .leading) {
                    Text(property.displayName)
                        .font(.headline)
                    Text("Due: $\(property.backTaxesAmount ?? 0, specifier: "%.2f")")
                        .foregroundColor(.red)
                    if let url = property.taxPortalURL {
                        Link("Pay Now", destination: url)
                    }
                }
            }
        }
        .navigationTitle("Tax Payments")
    }
}
