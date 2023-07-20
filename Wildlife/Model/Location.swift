//
//  Location.swift
//  Wildlife
//
//  Created by Joseph on 7/19/23.
//

import Foundation
import CoreLocation

struct NationalParkLocation: Identifiable, Codable{
    let id: String
    let name: String
    let image: String
    let latitude: Double
    let longitude: Double
    
    //computed property
    var location: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
