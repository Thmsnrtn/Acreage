//
//  CampaignRowView.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import SwiftUI

struct CampaignRowView: View {
    let campaign: MarketingCampaign

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(campaign.title)
                    .font(.headline)
                Text("Launches: \(campaign.launchDate, formatter: DateFormatter.shortDate)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }

            Spacer()

            Text(campaign.status.rawValue)
                .font(.caption)
                .foregroundColor(campaign.status == .active ? .green : .gray)
        }
        .padding(.vertical, 4)
    }
}

extension DateFormatter {
    static var shortDate: DateFormatter {
        let df = DateFormatter()
        df.dateStyle = .short
        return df
    }
}
