//
//  PortfolioView.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import SwiftUI

struct PortfolioView: View {
    @State var portfolios: [Portfolio] = []

    var body: some View {
        NavigationView {
            List {
                ForEach(portfolios) { portfolio in
                    VStack(alignment: .leading) {
                        Text(portfolio.name)
                            .font(.headline)
                        Text("Total Value: \(portfolio.totalValue, specifier: "%.2f")")
                            .font(.subheadline)
                    }
                }
            }
            .navigationTitle("Portfolios")
        }
    }
}
