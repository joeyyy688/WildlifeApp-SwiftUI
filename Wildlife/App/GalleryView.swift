//
//  GalleryView.swift
//  Wildlife
//
//  Created by Joseph on 7/13/23.
//

import SwiftUI

struct GalleryView: View {
    
    @State private var selectedGridItem: String = "lion"
    @State private var sliderValue = 1
    
    let haptickFeedback = UIImpactFeedbackGenerator(style: .medium)
    
    // SIMPLE GRID DEFINITION
    //let gridLayout: [GridItem] = [
    //    GridItem(.flexible()),
    //    GridItem(.flexible()),
    //    GridItem(.flexible())
    //]
    
    // EFFICIENT GRID DEFINITION
    //let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    // DYNAMIC GRID LAYOUT
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            
            VStack(alignment: .center, spacing: 10) {
                
                Image(selectedGridItem)
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(.white, lineWidth: 7))
                    .padding(.vertical, 20)
                
                
                Slider(value: $gridColumn, in: 2...4, step: 1)
                    .onChange(of: gridColumn, perform: { value in
                        haptickFeedback.impactOccurred()
                        gridSwitch()
                    })
                    .padding(.horizontal)
                    .padding(.vertical)

                
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animalsData) { item in
                        Image(item.image)
                            .renderingMode(.original)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(.white, lineWidth: 1))
                            .onTapGesture {
                                haptickFeedback.impactOccurred()
                                selectedGridItem = item.image
                            }
                    }//: FOREACH
                }//: LAZYVGRID
                .animation(.easeInOut)
                .onAppear(perform: {
                    gridSwitch()
                })
            }//: VSTACK
            .padding(.vertical, 10)
            .padding(.horizontal, 10)
        }//: SCROLLVIEW
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            MotionAnimationView()
        )
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
