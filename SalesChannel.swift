//
//  SalesChannel.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

enum SalesChannel: String, Codable, CaseIterable {
    case mls = "MLS"
    case facebookMarketplace = "Facebook Marketplace"
    case craigslist = "Craigslist"
    case landWatch = "LandWatch"
    case other = "Other"
}
