//
//  AnimalGridView.swift
//  Wildlife
//
//  Created by Joseph on 8/22/23.
//

import SwiftUI

struct AnimalItemGridView: View {
    let animal: Animal
    
    var body: some View {
        Image(animal.image)
            .renderingMode(.original)
            .resizable()
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct AnimalGridView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalItemGridView(animal: animalsData[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
