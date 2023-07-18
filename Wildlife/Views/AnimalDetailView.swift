//
//  DetailView.swift
//  Wildlife
//
//  Created by Joseph on 7/17/23.
//

import SwiftUI

struct AnimalDetailView: View {
    
    let animal: Animal
    @State var isAnimating: Bool = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                
                Image(animal.image)
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(isAnimating ? 1 : 0)
                
                Text(animal.name.uppercased())
                    .font(.system(.largeTitle, weight: .heavy))
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y: 25)
                    )
                
                Text(animal.headline)
                    .font(.system(.headline))
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                Group{
                    HeadingView(iconName: "photo.on.rectangle.angled", text: "Wilderness in Pictures")
                    
                    InsetGalleryView(animal: animal)
                }
                .padding(.horizontal)
                
                Group{
                    HeadingView(iconName: "questionmark.circle", text: "Did you know?")
                    
                    InsetFactView(animal: animal)
                }
                .padding(.horizontal)
                
                Group{
                    HeadingView(iconName: "info.circle", text: "All about \(animal.name)")
                    
                    Text(animal.description)
                        .font(.system(.headline))
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                }
                .padding(.horizontal)
                
                Group{
                    HeadingView(iconName: "map", text: "National Parks")
                    
                    InsetMapView()
                }
                .padding(.horizontal)
                
                Group{
                    HeadingView(iconName: "books.vertical", text: "Learn More")
                    ExternalWebLinkView(animal: animal)
                }
                .padding(.horizontal)
                
                
            }//: VSTACK
            .navigationBarTitle("Learn about \(animal.name)", displayMode: .inline)
        }//: SCROLLVIEW
        .onAppear(perform: {
            withAnimation(.easeInOut(duration: 0.25), {
                isAnimating = true
            })
        })
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AnimalDetailView(animal: animalsData[0])
        }
    }
}
