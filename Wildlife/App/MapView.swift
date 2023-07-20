//
//  MapView.swift
//  Wildlife
//
//  Created by Joseph on 7/13/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var region: MKCoordinateRegion = {
        var locationCoordinate = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var spanCoordinate = MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0)
        
        return MKCoordinateRegion(center: locationCoordinate, span: spanCoordinate)
    } ()
    
    
    
    var body: some View {
        // basic map
        //Map(coordinateRegion: $region)
        
        //advanced map
        Map(coordinateRegion: $region, annotationItems: mapData, annotationContent: { item in
            //1.  map marker
            //MapMarker(coordinate: item.location, tint: .accentColor)
            
            //2. map annotation
//            MapAnnotation(coordinate: item.location) {
//                Image("logo")
//                    .renderingMode(.original)
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 30, height: 30, alignment: .center)
//            }//: ANNOTATION
            
            //3. custom advanced annotation
            MapAnnotation(coordinate: item.location){
                MapAnnotationView(location: item)
            }
        })//: MAP
        .overlay(alignment: .top, content: {
            HStack(alignment: .center, spacing: 15){
                
                Image("compass")
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60, alignment: .center)
                
                VStack(alignment: .leading, spacing: 3){
                    HStack {
                        Text("Latitude")
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        
                        Spacer()
                        
                        Text("\(region.center.latitude)")
                        
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Longitude")
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        
                        Spacer()
                        
                        Text("\(region.center.longitude)")
                    }
                }
                
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 20)
            .background(
                Color.black
                    .opacity(0.7)
                    .cornerRadius(10)
            )
            .padding()
        })
        
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
