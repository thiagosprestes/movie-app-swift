//
//  Movie.swift
//  MovieApp
//
//  Created by Thiago on 16/02/24.
//

import Foundation

struct PopularMoviesResponse: Decodable {
    let page: Int
    let results: [Movie]
    let total_pages: Int
    let total_results: Int
}
