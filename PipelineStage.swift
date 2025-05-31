//
//  PipelineStage.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

enum PipelineStage: String, Codable, CaseIterable {
    case newLead = "New Lead"
    case research = "Research"
    case dueDiligence = "Due Diligence"
    case offerMade = "Offer Made"
    case underContract = "Under Contract"
    case marketing = "Marketing"
    case sold = "Sold"
}
