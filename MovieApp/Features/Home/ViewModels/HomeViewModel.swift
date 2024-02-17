//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by Thiago on 15/02/24.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    private var provider: NetworkManager?
    
    @State var selectedGenre = "Ação"
    
    enum ScreenState {
        case defaultState
        case loading
        case success
        case failed(error: Error)
    }
    
    @Published var state: ScreenState = .defaultState
    
    @Published var popularMovies: [Movie]
    @Published var genres: [Genre]
    @Published var newReleases: [Movie]
    @Published var topRated: [Movie]
    
    init(
        provider: NetworkManager? = NetworkManager(),
        popularMovies: [Movie] = [],
        genres: [Genre] = [],
        newReleases: [Movie] = [],
        topRated: [Movie] = []
    ) {
        self.provider = provider
        self.popularMovies = popularMovies
        self.genres = genres
        self.newReleases = newReleases
        self.topRated = topRated
        
        Task {
            await onGetData()
        }
    }
    
    func onGetData() async {
        self.state = .loading
        
        do {
            let popularMoviesResponse = try await provider?.fetch(PopularMoviesResponse.self, endpoint: "/movie/popular")
            let genresResponse = try await provider?.fetch(GenresResponse.self, endpoint: "/genre/movie/list")
            let newReleasesResponse = try await provider?.fetch(NewReleasesResponse.self, endpoint: "/movie/now_playing")
            let topRatedResponse = try await provider?.fetch(NewReleasesResponse.self, endpoint: "/movie/top_rated")
            
            if(provider != nil) {
                self.popularMovies = popularMoviesResponse?.results ?? []
                self.genres = genresResponse?.genres ?? []
                self.newReleases = newReleasesResponse?.results ?? []
                self.topRated = topRatedResponse?.results ?? []
            }
            
            self.state = .success
        }  catch {
            print(error)
            self.state = .failed(error: error)
        }
    }
    
    func isGenreSelected(item: String) -> Bool {
        return selectedGenre == item
    }
}
