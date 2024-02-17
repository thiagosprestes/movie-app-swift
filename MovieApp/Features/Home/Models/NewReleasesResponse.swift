//
//  NewReleasesResponse.swift
//  MovieApp
//
//  Created by Thiago on 16/02/24.
//

import Foundation

struct NewReleasesResponse: Decodable {
    let results: [Movie]
}
