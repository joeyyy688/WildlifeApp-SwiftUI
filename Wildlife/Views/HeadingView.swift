//
//  HeadingView.swift
//  Wildlife
//
//  Created by Joseph on 7/17/23.
//

import SwiftUI

struct HeadingView: View {
    
    var iconName: String
    var text: String
    
    var body: some View {
        HStack{
            Image(systemName: iconName)
                .font(.system(.largeTitle))
                .foregroundColor(.accentColor)
            
            Text(text)
                .font(.system(.title3, weight: .heavy))
        }
    }
}

struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingView(iconName: "photo.on.rectangle.angled", text: "Wilderness in Pictures")
    }
}
