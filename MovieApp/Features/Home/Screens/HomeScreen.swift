//
//  HomeView.swift
//  MovieApp
//
//  Created by Thiago on 15/02/24.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject var viewModel = HomeViewModel()
    
    var defaultState: some View {
        ScrollView {
            HStack {
                Spacer()
                Image(systemName: "magnifyingglass")
                    .frame(width: 24, height: 24)
                    .foregroundColor(Color("white"))
                Image(systemName: "bell")
                    .frame(width: 24, height: 24)
                    .foregroundColor(Color("white"))
            }
            .frame(maxWidth: .infinity)
            .padding([.leading, .trailing], 16)
            .padding(.bottom, 26)
            CarouselView(viewModel: viewModel)
            GenresView(viewModel: viewModel)
            MoviesListView(type: MovieListType.newReleases, viewModel: viewModel)
            MoviesListView(type: MovieListType.upcoming, viewModel: viewModel)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("background"))
    }
    
    var loadingState: some View {
        ProgressView()
    }
    
    var body: some View {
        switch viewModel.state {
        case .defaultState:
            defaultState
        case .loading:
            loadingState
        case .failed(error: let error):
            loadingState
        }
    }
}

struct HomeScreenPreview: PreviewProvider {
    static var previews: some View {
        HomeScreen(viewModel: HomeViewModel(
            provider: nil,
            popularMovies: [
                Movie(
                    adult: false,
                    backdrop_path: "/criPrxkTggCra1jch49jsiSeXo1.jpg",
                    genre_ids: [10], id: 18272,
                    original_language: "en-US",
                    original_title: "The marvels",
                    overview: "",
                    popularity: 1,
                    poster_path: "/criPrxkTggCra1jch49jsiSeXo1.jpg",
                    release_date: "01-01-2024",
                    title: "",
                    video: false,
                    vote_average: 10.0,
                    vote_count: 10
                ),
                Movie(
                    adult: false,
                    backdrop_path: "/criPrxkTggCra1jch49jsiSeXo1.jpg",
                    genre_ids: [10], id: 18272,
                    original_language: "en-US",
                    original_title: "The marvels",
                    overview: "",
                    popularity: 1,
                    poster_path: "/criPrxkTggCra1jch49jsiSeXo1.jpg",
                    release_date: "01-01-2024",
                    title: "",
                    video: false,
                    vote_average: 10.0,
                    vote_count: 10
                )
            ],
            genres: [Genre(id: 1, name: "Action")],
            newReleases: [
                Movie(
                    adult: false,
                    backdrop_path: "/zVMyvNowgbsBAL6O6esWfRpAcOb.jpg",
                    genre_ids: [10], id: 18272,
                    original_language: "en-US",
                    original_title: "The marvels",
                    overview: "",
                    popularity: 1,
                    poster_path: "/zVMyvNowgbsBAL6O6esWfRpAcOb.jpg",
                    release_date: "01-01-2024",
                    title: "",
                    video: false,
                    vote_average: 10.0,
                    vote_count: 10
                )
            ]
        ))
    }
}
