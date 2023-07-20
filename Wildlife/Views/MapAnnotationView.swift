//
//  MapAnnotationView.swift
//  Wildlife
//
//  Created by Joseph on 7/19/23.
//

import SwiftUI

struct MapAnnotationView: View {
    
    var location: NationalParkLocation
    @State private var animationValue: Double = 0.0
    
    var body: some View {
        
        ZStack {
            
            Circle()
                .fill()
                .foregroundColor(.accentColor)
                .frame(width: 55, height: 55, alignment: .center)
            
            Circle()
                .stroke(lineWidth: 2)
                .foregroundColor(.accentColor)
                .frame(width: 70, height: 70)
                .scaleEffect(1 + CGFloat(animationValue))
                .opacity(1 - animationValue)
            
            
            Image(location.image)
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            

        }//: ZSTACK
        .onAppear(perform: {
            withAnimation(.easeOut(duration: 2).repeatForever(autoreverses: false), {
                animationValue = 1.0
            })
        })
    }
}

struct MapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        MapAnnotationView(location: mapData[0])
            .previewLayout(.sizeThatFits)
    }
}
