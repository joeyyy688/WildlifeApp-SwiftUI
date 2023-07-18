//
//  InsetGalleryView.swift
//  Wildlife
//
//  Created by Joseph on 7/17/23.
//

import SwiftUI

struct InsetGalleryView: View {
    
    var animal: Animal
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack(alignment: .center, spacing: 20) {
                
                ForEach(animal.gallery, id: \.self) { item in
                    Image(item)
                        .renderingMode(.original)
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .frame(height: 200)
                }
            }
        }//: SCROLLVIEW
    }
}

struct InsetGalleryView_Previews: PreviewProvider {
    static var previews: some View {
        InsetGalleryView(animal: animalsData[0])
    }
}
