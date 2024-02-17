//
//  GenresView.swift
//  MovieApp
//
//  Created by Thiago on 15/02/24.
//

import SwiftUI

struct GenresView: View {
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Genres").customTextStyle(size: 14, type: .medium).foregroundColor(Color("white")).padding([.leading, .trailing],16)
            ScrollView(.horizontal) {
                HStack {
                    ForEach(viewModel.genres, id: \.id) { item in
                        Text(item.name).customTextStyle(size: 14, type: .medium)
                            .foregroundColor(viewModel.isGenreSelected(item: item.name) ?  Color("white") : Color("grey"))
                            .padding([.leading, .trailing], 21)
                            .padding([.top, .bottom], 6)
                            .background(
                                viewModel.isGenreSelected(item: item.name) ?  Color("red") : Color("background")
                            )
                            .overlay(
                                viewModel.isGenreSelected(item: item.name) ? nil : RoundedRectangle(cornerRadius: 28).stroke(Color("grey"), lineWidth:1)
                            )
                            .cornerRadius(28)
                            .padding(.trailing, 10)
                    }
                }.padding([.leading, .trailing],16)
            }.scrollIndicators(.hidden)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.bottom, 24)
    }
}

struct GenresViewPreview: PreviewProvider {
    static var previews: some View {
        GenresView(viewModel: HomeViewModel(
            provider: nil,
            genres: [Genre(id: 1, name: "Action")]
        ))
    }
}

