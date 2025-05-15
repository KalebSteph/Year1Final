//
//  SearchScreen.swift
//  SimplyCards
//
//  Created by Kaleb Stephens on 5/12/25.
//

import SwiftUI

struct Player: Identifiable, Codable{
    var id:String
    var name:String
    var date: String
    var location: String
}

struct PlayerResponse: Codable {
    var data: [Player]
}

func getPlayers() async throws -> [Player] {
    enum WebRequestError: Error {
        case codeRequestError
    }

    let (data, response) = try await URLSession.shared.data(from: URL(string: "http://localhost:3005/players")!)

    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        throw WebRequestError.codeRequestError
    }

    let jsonDecoder = JSONDecoder()
    let result = try jsonDecoder.decode([Player].self, from: data)

    return result
}


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

