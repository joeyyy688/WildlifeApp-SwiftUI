//
//  CreditView.swift
//  Wildlife
//
//  Created by Joseph on 8/22/23.
//

import SwiftUI

struct CreditView: View {
    var body: some View {
        VStack {
            Image("compass")
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            
            Text("""
            Copyright © JKD
            All rights reserved
            Better Apps ♡ Less Code
            """
            )
            .font(.system(.footnote))
            .multilineTextAlignment(.center)
        }//: VSTACK
        .padding()
        .opacity(0.4)
        
    }
}

struct CreditView_Previews: PreviewProvider {
    static var previews: some View {
        CreditView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
