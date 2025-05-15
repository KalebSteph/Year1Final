//
//  SearchScreen.swift
//  SimplyCards
//
//  Created by Kaleb Stephens on 5/12/25.
//

import SwiftUI

struct Player: Codable, Identifiable{
    var id : Int
    var date:String
    var time: String
    var location: String
    
    enum CodingKeys: String, CodingKey {
        case id = "PlayerID"
        case date
        case time
        case location
    }
}



func getPlayers() async throws -> [Player] {
    enum WebRequestError: Error {
        case codeRequestError
    }

    let url = URL(string: "http://localhost:3005/players")!
    let (data, response) = try await URLSession.shared.data(from: url)
    
    print(String(data: data, encoding: .utf8))

    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
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

