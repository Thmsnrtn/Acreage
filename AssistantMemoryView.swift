//
//  AssistantMemoryView.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import SwiftUI

struct AssistantMemoryView: View {
    @ObservedObject var memory = AssistantMemoryEngine.shared

    var body: some View {
        List(memory.recentEntries(), id: \.id) { record in
            VStack(alignment: .leading) {
                Text("\(record.action)")
                    .font(.headline)
                Text(record.context)
                    .font(.caption)
                    .foregroundColor(.gray)
                Text(record.timestamp.formatted())
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
        }
        .navigationTitle("Assistant Memory Log")
    }
}
