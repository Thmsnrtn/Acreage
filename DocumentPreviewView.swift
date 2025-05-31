//
//  DocumentPreviewView.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import SwiftUI

struct DocumentPreviewView: View {
    let renderedContent: String

    var body: some View {
        ScrollView {
            Text(renderedContent)
                .font(.body)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background(Color(NSColor.textBackgroundColor))
        .navigationTitle("Preview")
    }
}
