//
//  AnimalListItem.swift
//  Wildlife
//
//  Created by Joseph on 7/17/23.
//

import SwiftUI

struct AnimalListItem: View {
    
    var data: Animal
    
    var body: some View {
        HStack(spacing: 10) {
            
            Image(data.image)
                .renderingMode(.original)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .cornerRadius(20)
                        
            VStack(alignment: .leading, spacing: 5) {
                Text(data.name)
                    .font(.system(.title2, weight: .heavy))
                    .foregroundColor(.accentColor)
                
                Text(data.headline)
                    .font(.system(.footnote))
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)

            }//: VSTACK
        }//: HSTACK
    }
}

struct AnimalListItem_Previews: PreviewProvider {
    static var previews: some View {
        AnimalListItem(data: animalsData[2])
            .padding()
    }
}
