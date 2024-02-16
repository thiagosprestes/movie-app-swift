//
//  HomeView.swift
//  MovieApp
//
//  Created by Thiago on 15/02/24.
//

import SwiftUI

struct HomeScreen: View {
    @State var url = URL(string: "https://www.laranjacast.com.br/wp-content/uploads/2023/12/madame-web-poster-1-2-1024x1280.webp")
    
    var body: some View {
        VStack {
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
            CarouselView()
            GenresView()
            MoviesListView()
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("background"))
    }
}

struct HomeScreenPreview: PreviewProvider {
    static var previews: some View {
        HomeScreen().environmentObject(HomeViewModel())
    }
}
