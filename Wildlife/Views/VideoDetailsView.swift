//
//  VideoDetailsView.swift
//  Wildlife
//
//  Created by Joseph on 7/19/23.
//

import SwiftUI

struct VideoDetailsView: View {
    
    var video: Video
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct VideoDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        VideoDetailsView(video: videosData[0])
    }
}
