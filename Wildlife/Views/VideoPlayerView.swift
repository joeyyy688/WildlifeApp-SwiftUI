//
//  VideoDetailsView.swift
//  Wildlife
//
//  Created by Joseph on 7/19/23.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    
    var video: Video
    
    var body: some View {
        //VideoPlayer(player: AVPlayer(url: Bundle.main.url(forResource: video.id, withExtension: "mp4")!))
        VStack {
            VideoPlayer(player: playVideo(fileName: video.id, fileFormat: "mp4")){
                
            }
            .overlay(
                Image("logo")
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                    .padding()
                
                , alignment: .topLeading
            )
        }//: VSTACK
        .accentColor(.accentColor)
        .navigationTitle(video.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct VideoDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            VideoPlayerView(video: videosData[2])
        }
    }
}
