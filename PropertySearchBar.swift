//
//  PropertySearchBar.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import SwiftUI

struct PropertySearchBar: View {
    @Binding var query: String

    var body: some View {
        TextField("Search properties...", text: $query)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
    }
}
