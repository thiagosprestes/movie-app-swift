//
//  CarouselView.swift
//  MovieApp
//
//  Created by Thiago on 15/02/24.
//

import SwiftUI

struct CarouselView: View {
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        TabView {
            ForEach(viewModel.popularMovies, id: \.id) { item in
                AsyncImage(
                    url: URL(string: "https://image.tmdb.org/t/p/original\(item.backdrop_path)"),
                    content: { image in
                        image.image?.resizable().aspectRatio(contentMode: .fill).cornerRadius(10)
                    }
                )
                .overlay {
                    LinearGradient(
                        colors: [.clear, .black],
                        startPoint: .center,
                        endPoint: .bottom
                    ).cornerRadius(10)
                    Text(item.title).customTextStyle(size: 20, type: .medium)
                        .foregroundColor(Color("white"))
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                        .padding(20)
                }
                .frame(height: 192)
                .padding([.leading, .trailing], 16)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .frame(height: 280)
    }
}

struct CarouselViewPreview: PreviewProvider {
    static var previews: some View {
        CarouselView(viewModel: HomeViewModel(
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
                    title: "As Marvels",
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
                    title: "As Marvels",
                    video: false,
                    vote_average: 10.0,
                    vote_count: 10
                )
            ]
        ))
    }
}
