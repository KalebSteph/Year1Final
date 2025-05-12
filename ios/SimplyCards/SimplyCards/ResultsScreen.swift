//
//  ResultsScreen.swift
//  SimplyCards
//
//  Created by Kaleb Stephens on 5/12/25.
//

import SwiftUI

struct ResultsScreen: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Select Player")
                .font(.title)
            
            ForEach(1..<8) { _ in
                VStack(alignment: .leading) {
                    Text("Name:")
                    Text("Location:")
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color("ButtonColor"))
            }

            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("CardBackground"))
        .ignoresSafeArea()
    }
}

