//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by Thiago on 15/02/24.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @State var selectedGenre = "Drama"
    
    @State var genres = [
        "Drama",
        "Action",
        "Romance",
        "Comedy",
        "Terror"
    ]
    
    @Environment(\.apiKey) var apiKey
    
    func isGenreSelected(item: String) -> Bool {
        return selectedGenre == item
    }
    
    func getPopularMovies() {
        
    }
}
