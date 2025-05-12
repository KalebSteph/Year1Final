//
//  SearchScreen.swift
//  SimplyCards
//
//  Created by Kaleb Stephens on 5/12/25.
//

import SwiftUI

struct SearchScreen: View {
    var body: some View {
        VStack(spacing: 40) {
            Text("Welcome\nTo\nSimply\nCards")
                .font(.largeTitle)
                .multilineTextAlignment(.center)

            NavigationLink(destination: ResultsScreen()) {
                Text("Find Players")
                    .frame(width: 150, height: 80)
                    .background(Color("ButtonColor"))
                    .foregroundColor(.black)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("CardBackground"))
        .ignoresSafeArea()
    }
}

