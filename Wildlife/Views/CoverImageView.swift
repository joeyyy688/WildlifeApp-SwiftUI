//
//  CoverImageView.swift
//  Wildlife
//
//  Created by Joseph on 7/13/23.
//

import SwiftUI

struct CoverImageView: View {
    
    var images: [CoverImageModel]
    
    var body: some View {
        TabView {
            ForEach(coverImagesData) { item in
                Image(item.name)
                    .resizable()
                    .renderingMode(.original)
                .scaledToFill()
            }
        }
        .tabViewStyle(PageTabViewStyle())
        
    }
}

struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView(images: coverImagesData)
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
