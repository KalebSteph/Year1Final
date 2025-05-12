//
//  HomeScreen.swift
//  SimplyCards
//
//  Created by Kaleb Stephens on 5/12/25.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        ZStack {
            // Fullscreen background color
            Color("CardBackground")
                .ignoresSafeArea()

            VStack(spacing: 40) {
                Text("Simply\nCards")
                    .font(.largeTitle)
                    .foregroundColor(.black)

                Image("Cards")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                    .padding()

                NavigationLink(destination: SearchScreen()) {
                    Text("Play")
                        .frame(width: 120, height: 60)
                        .background(Color("ButtonColor"))
                        .foregroundColor(.black)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity) // ensure the ZStack stretches fully
    }
}

