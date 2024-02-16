//
//  CarouselView.swift
//  MovieApp
//
//  Created by Thiago on 15/02/24.
//

import SwiftUI

struct CarouselView: View {
    @State var url = URL(string: "https://img.r7.com/images/deadpool-no-filme-deadpool-wolverine-14022024073129447?dimensions=771x420")
    
    @EnvironmentObject var viewModel: HomeViewModel
    
    var body: some View {
        TabView {
            ForEach((0..<3), id: \.self) { index in
                AsyncImage(
                    url: url,
                    content: { image in
                        image.image?.resizable().aspectRatio(contentMode: .fill).cornerRadius(10)
                    }
                ).frame(width: 320, height: 192)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .frame(height: 192)
    }
}

struct CarouselViewPreview: PreviewProvider {
    static var previews: some View {
        CarouselView().environmentObject(HomeViewModel())
    }
}
