//
//  InsetMapView.swift
//  Wildlife
//
//  Created by Joseph on 7/18/23.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599), span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0) )
    
    var body: some View {
        Map(coordinateRegion: $region)
            .overlay(
                NavigationLink {
                    MapView()
                }label: {
                    
                    HStack {
                        Image(systemName: "mappin.circle")
                            .font(.system(size: 25))
                            .foregroundColor(.accentColor)
                            .fontWeight(.bold)
                        
                        Text("Locations")
                            .font(.system(.title3))
                            .foregroundColor(.accentColor)
                            .fontWeight(.bold)
                    }//: HSTACK
                    .padding(.vertical, 10)
                    .padding(.horizontal, 10)
                    .background(
                        Color.black
                            .opacity(0.4)
                            .cornerRadius(10)
                    )
                }//: NAVIGATIONLINK
                    .padding(15)
                
                , alignment: .topTrailing
            )
            .frame(height: 256)
            .cornerRadius(12)
    }
}

struct InsetMapView_Previews: PreviewProvider {
    static var previews: some View {
        InsetMapView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
