//
//  GenresView.swift
//  MovieApp
//
//  Created by Thiago on 15/02/24.
//

import SwiftUI

struct GenresView: View {
    @EnvironmentObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Genres").customTextStyle(size: 14, type: .medium).foregroundColor(Color("white")).padding([.leading, .trailing],16)
            ScrollView(.horizontal) {
                HStack {
                    ForEach(viewModel.genres, id: \.self) { item in
                        Text(item).customTextStyle(size: 14, type: .medium)
                            .foregroundColor(viewModel.isGenreSelected(item: item) ?  Color("white") : Color("grey"))
                            .padding([.leading, .trailing], 21)
                            .padding([.top, .bottom], 6)
                            .background(
                                viewModel.isGenreSelected(item: item) ?  Color("red") : Color("background")
                            )
                            .overlay(
                                viewModel.isGenreSelected(item: item) ? nil : RoundedRectangle(cornerRadius: 28).stroke(Color("grey"), lineWidth:1)
                            )
                            .cornerRadius(28)
                            .padding(.trailing, 10)
                    }
                }.padding([.leading, .trailing],16)
            }.scrollIndicators(.hidden)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding([.top, .bottom], 24)
    }
}

struct GenresViewPreview: PreviewProvider {
    static var previews: some View {
        GenresView().environmentObject(HomeViewModel())
    }
}

