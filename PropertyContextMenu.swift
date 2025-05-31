//
//  PropertyContextMenu.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import SwiftUI

struct PropertyContextMenu: View {
    var property: Property
    var onEdit: () -> Void
    var onDelete: () -> Void
    var onAnalyze: () -> Void

    var body: some View {
        Menu {
            Button("Edit", action: onEdit)
            Button("Delete", action: onDelete)
            Button("Analyze", action: onAnalyze)
        } label: {
            Image(systemName: "ellipsis.circle")
                .font(.title3)
        }
    }
}
