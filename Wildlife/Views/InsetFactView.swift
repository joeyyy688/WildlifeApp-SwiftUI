//
//  FactView.swift
//  Wildlife
//
//  Created by Joseph on 7/18/23.
//

import SwiftUI

struct InsetFactView: View {
    
    var animal: Animal
    
    var body: some View {
            GroupBox {
                TabView {
                    ForEach(animal.fact, id: \.self) { item in
                        Text(item)
                            .font(.system(.title2))
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .frame(minHeight: 150, idealHeight: 230, maxHeight: 300)
            }
            

    }
}

struct FactView_Previews: PreviewProvider {
    static var previews: some View {
        InsetFactView(animal: animalsData[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
