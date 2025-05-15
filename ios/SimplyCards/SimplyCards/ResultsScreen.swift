//
//  ResultsScreen.swift
//  SimplyCards
//
//  Created by Kaleb Stephens on 5/12/25.
//

import SwiftUI

struct ResultsScreen: View {
    @State private var players: [Player] = []
    @State private var error: String?

    var body: some View {
        VStack {
            if let error = error {
                Text("Error: \(error)")
            }

            List(players) { player in
                VStack(alignment: .leading) {
                    Text(player.name)
                        .font(.headline)
                    Text("Date: \(player.date)")
                    Text("Location: \(player.location)")
                }
            }

            Button("Refresh Players") {
                Task {
                    do {
                        players = try await getPlayers()
                    } catch {
                        self.error = error.localizedDescription
                    }
                }
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .onAppear {
            Task {
                do {
                    players = try await getPlayers()
                } catch {
                    self.error = error.localizedDescription
                }
            }
        }
    }
}


