//
//  MotionAnimationView.swift
//  Wildlife
//
//  Created by Joseph on 7/21/23.
//

import SwiftUI

struct MotionAnimationView: View {
    
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimating = false
    
    
    func randomXCoordinate(_ geometry: GeometryProxy) -> CGFloat{
        return CGFloat.random(in: (10) ... (geometry.size.width) )
    }
    
    func randomYCoordinate(_ geometry: GeometryProxy) -> CGFloat{
        return CGFloat.random(in: (10) ... (geometry.size.height) )
    }
    
    func randomSize() -> CGFloat{
        return CGFloat.random(in: 200...300)
    }
    
    func randomScale() -> CGFloat{
        return CGFloat(Double.random(in:  0.1 ... 2.0))
    }
    
    func randomSpeed() -> Double{
        return Double.random(in: 0.05 ... 1.0)
    }
    
    func randomDelay() -> Double{
        return Double.random(in: 0 ... 2.0)
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0...randomCircle, id: \.self) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.2)
                        .frame(width: randomSize(), height: randomSize())
                        .position(
                            x: randomXCoordinate(geometry),
                            y: randomYCoordinate(geometry)
                        )
                        .scaleEffect(isAnimating ? randomScale() : 1.0)
                }

            }//: ZSTACK
            .onAppear(perform: {
                withAnimation(
                    .interpolatingSpring(stiffness: 0.5, damping: 0.5).repeatForever().speed(randomSpeed()).delay(randomDelay()), {
                    isAnimating = true
                })
            })
            .drawingGroup()
        }//: GEOMETRY READER
    }
}

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}
