//
//  Constants.swift
//  MovieApp
//
//  Created by Thiago on 16/02/24.
//

import Foundation

struct Helpers {
    func createURL(for endpoint: String) -> URL? {
        let baseURL = "https://api.themoviedb.org/3\(endpoint)"
        
        let queryItems = [
            URLQueryItem(name: "language", value: "pt-BR"),
            URLQueryItem(name: "page", value: "1"),
            URLQueryItem(name: "region", value: "BR")
        ]
        
        var urlComponents = URLComponents(string: baseURL)
        
        urlComponents?.queryItems = queryItems
        
        return urlComponents?.url
    }
}
