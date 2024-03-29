//
//  MoviesList.swift
//  MovieApp
//
//  Created by Thiago on 15/02/24.
//

import SwiftUI

enum MovieListType {
    case newReleases, upcoming
}

struct MoviesListView: View {
    var type: MovieListType
    
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text(type == MovieListType.newReleases ? "Novos lançamentos" : "Os favoritos do público").customTextStyle(size: 18, type: .medium).foregroundColor(Color("white"))
                Spacer()
                Text("Ver mais").customTextStyle(size: 12, type: .bold).foregroundColor(Color("red"))
            }
            .frame(maxWidth: .infinity, alignment: .bottom)
            .padding([.leading, .trailing], 16)
            ScrollView(.horizontal) {
                HStack {
                    ForEach(type == MovieListType.newReleases ? viewModel.newReleases : viewModel.topRated, id: \.id) { item in
                        AsyncImage(
                            url: URL(string: "https://image.tmdb.org/t/p/original\(item.poster_path)"),
                            content: { image in
                                image.image?
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 150, height: 243)
                                    .cornerRadius(10)
                            }
                        ).padding(.trailing, 10)
                    }
                }.padding([.leading, .trailing], 16)
            }.scrollIndicators(.hidden)
        }.padding([.top,.bottom], 24)
    }
}

struct MoviesListViewPreview: PreviewProvider {
    static var previews: some View {
        MoviesListView(
            type: MovieListType.newReleases,
            viewModel: HomeViewModel(
            provider: nil,
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
