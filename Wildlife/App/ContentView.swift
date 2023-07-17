//
//  ContentView.swift
//  Wildlife
//
//  Created by Joseph on 7/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List{
                CoverImageView(images: coverImagesData)
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                
                ForEach(animalsData.shuffled()) { item in
                    AnimalListItem(data: item)
                }
            }//: LIST
            .navigationBarTitle("Africa", displayMode: .large)
        }//: NAVIGATION VIEW
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
