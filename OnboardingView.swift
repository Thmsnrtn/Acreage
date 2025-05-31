//
//  OnboardingView.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import SwiftUI

struct OnboardingView: View {
    @State private var step = 0

    var body: some View {
        VStack {
            TabView(selection: $step) {
                Text("Welcome to Acreage!").tag(0)
                Text("Automate your land business.").tag(1)
                Text("Let’s get started!").tag(2)
            }
            .tabViewStyle(PageTabViewStyle())

            Button(action: {
                if step < 2 {
                    step += 1
                } else {
                    // mark onboarding complete
                }
            }) {
                Text(step < 2 ? "Next" : "Finish")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}
