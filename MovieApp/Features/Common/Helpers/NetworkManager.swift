//
//  Network.swift
//  MovieApp
//
//  Created by Thiago on 16/02/24.
//

import SwiftUI

class NetworkManager {
    enum ServiceError: Error {
        case failed
        case failedToDecode
        case invalidStatusCode
    }
    
    func fetch<T: Decodable>(_ type: T.Type, endpoint: String) async throws -> T {
        @Environment(\.apiKey) var apiKey
        
        let url = Helpers().createURL(for: endpoint)
        
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.setValue(
            "Bearer \(apiKey)",
            forHTTPHeaderField: "Authorization"
        )
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (data, response) = try await URLSession.shared.data(for: request)

        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw ServiceError.invalidStatusCode
        }
        
        let decodedData = try JSONDecoder().decode(type.self, from: data)
        
        return decodedData.self
    }
}
