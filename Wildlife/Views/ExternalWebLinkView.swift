//
//  ExternalWebLinkView.swift
//  Wildlife
//
//  Created by Joseph on 7/18/23.
//

import SwiftUI

struct ExternalWebLinkView: View {
    
    var animal: Animal
    
    var body: some View {
        GroupBox {
            HStack{
                
                Group {
                    Image(systemName: "globe")
                    Text("Wikipedia")
                }
                
                Spacer()
                
                Group {
                    Link(animal.name, destination: URL(string: animal.link)!)
                    Image(systemName: "arrow.up.right.square")
                }
                .foregroundColor(.accentColor)
                
            }
        }//: GROUPBOX
    }
}

struct ExternalWebLinkView_Previews: PreviewProvider {
    static var previews: some View {
        ExternalWebLinkView(animal: animalsData[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
