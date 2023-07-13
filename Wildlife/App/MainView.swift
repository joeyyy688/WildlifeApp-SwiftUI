//
//  MainView.swift
//  Wildlife
//
//  Created by Joseph on 7/13/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            ContentView()
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Browse")
                }
            
            VideoListView()
                .tabItem {
                    Image(systemName: "play.rectangle")
                    Text("Video")
                }
            
            MapView()
                .tabItem {
                    Image(systemName: "map")
                    Text("Location")
                }
            
            ContentView()
                .tabItem {
                    Image(systemName: "photo")
                    Text("Gallery")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
