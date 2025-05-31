//
//  PurchaseReviewView.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import SwiftUI

struct PurchaseReviewView: View {
    @ObservedObject var manager = PurchaseManager.shared

    var body: some View {
        VStack {
            Text("Review Purchase Offers")
                .font(.title2)
                .bold()

            List {
                ForEach(manager.pendingPurchases) { property in
                    VStack(alignment: .leading) {
                        Text(property.apn).bold()
                        Text(property.fullAddress).font(.caption)
                        Text("Offer: $\(Int(property.assessedValue * 0.25))")
                            .foregroundColor(.green)
                    }
                }
            }

            Button("Send Offers") {
                MailService.shared.sendOffers(for: manager.pendingPurchases)
                manager.clear()
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .padding()
    }
}
