//
//  VideoListItem.swift
//  Wildlife
//
//  Created by Joseph on 7/19/23.
//

import SwiftUI

struct VideoListItemView: View {
    
    var data: Video
    
    var body: some View {
        HStack(spacing: 10) {

            ZStack {
                Image(data.thumbNail)
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 90)
                    .cornerRadius(10)
                
                Image(systemName: "play.circle")
                    .font(.system(.largeTitle, weight: .bold))
                
            }

            VStack(alignment: .leading, spacing: 5) {
                Text(data.name)
                    .font(.system(.title2, weight: .heavy))
                    .foregroundColor(.accentColor)

                Text(data.headline)
                    .font(.system(.footnote))
                    .multilineTextAlignment(.leading)

            }//: VSTACK
        }//: HSTACK
    }
}

struct VideoListItem_Previews: PreviewProvider {
    static var previews: some View {
        VideoListItemView(data: videosData[0])
    }
}
