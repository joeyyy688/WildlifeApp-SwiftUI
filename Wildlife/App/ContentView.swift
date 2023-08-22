//
//  ContentView.swift
//  Wildlife
//
//  Created by Joseph on 7/12/23.
//

import SwiftUI

struct ContentView: View {
    
    let hapticFeed = UIImpactFeedbackGenerator(style: .medium)
    @State private var isGridViewActive: Bool = false
    //let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    
    // DYNAMIC GRID LAYOUT
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var toolBarIcon: String = "square.grid.2x2"
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        
        switch gridColumn {
        case 1:
            toolBarIcon = "square.grid.2x2"
        case 2:
            toolBarIcon = "square.grid.3x2"
        case 3:
            toolBarIcon = "rectangle.grid.1x2"
        default:
            toolBarIcon = "square.grid.2x2"
        }
    }
    
    
    var body: some View {
        NavigationView {
            Group{
                if !isGridViewActive {
                    List{
                        CoverImageView(images: coverImagesData)
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        ForEach(animalsData.shuffled()) { item in
                            NavigationLink {
                                AnimalDetailView(animal: item)
                            } label: {
                                AnimalListItem(data: item)
                            }
                        }
                    }//: LIST
                } else {
                    ScrollView{
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animalsData) { item in
                                NavigationLink {
                                    AnimalDetailView(animal: item)
                                } label: {
                                    AnimalItemGridView(animal: item)
                                }
                
                            }//: FOREACH
                        }//: LAZYVGRID
                        .padding(.horizontal)
                        .animation(.easeOut)
                    }
                }//: CONDITIONAL STATEMENT
            }
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing, content: {
                    HStack(spacing: 16) {
                        // LIST
                        Button(action: {
                            isGridViewActive = false
                            hapticFeed.impactOccurred()
                        }, label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        })
                        
                        // GRID
                        Button(action: {
                            isGridViewActive = true
                            hapticFeed.impactOccurred()
                            gridSwitch()
                        }, label: {
                            Image(systemName: toolBarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ?  .accentColor : .primary)
                        })
                    }
                })
            }
        }//: NAVIGATION VIEW
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
