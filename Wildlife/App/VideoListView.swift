//
//  VideoListView.swift
//  Wildlife
//
//  Created by Joseph on 7/13/23.
//

import SwiftUI

struct VideoListView: View {
    
    @State private var videoListData: [Video] = videosData
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    var body: some View {
        NavigationView {
            List{
                ForEach(videoListData) { item in
                    NavigationLink {
                        VideoPlayerView(video: item)
                    } label: {
                        VideoListItemView(data: item)
                            .padding(.vertical, 8)
                    }
                }
            }//: LIST
            .listStyle(.insetGrouped)
            .navigationBarTitle("Videos", displayMode: .inline)
            .toolbar(content: {
                Button(action: {
                    videoListData = videoListData.shuffled()
                    hapticImpact.impactOccurred()
                }, label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.system(.title3))
                })
            })
        }//: NAVIGATIONVIEW
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
