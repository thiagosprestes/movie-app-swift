//
//  MoviesList.swift
//  MovieApp
//
//  Created by Thiago on 15/02/24.
//

import SwiftUI

struct MoviesListView: View {
    @State var url = URL(string: "https://img.r7.com/images/deadpool-no-filme-deadpool-wolverine-14022024073129447?dimensions=771x420")
    
    @EnvironmentObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("New Releases").customTextStyle(size: 18, type: .medium).foregroundColor(Color("white"))
                Spacer()
                Text("View All").customTextStyle(size: 12, type: .bold).foregroundColor(Color("red"))
            }
            .frame(maxWidth: .infinity, alignment: .bottom)
            .padding([.leading, .trailing], 16)
            ScrollView(.horizontal) {
                HStack {
                    ForEach(1...3, id: \.self) { item in
                        AsyncImage(
                            url: url,
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
        }
    }
}

struct MoviesListViewPreview: PreviewProvider {
    static var previews: some View {
        MoviesListView().environmentObject(HomeViewModel())
    }
}
