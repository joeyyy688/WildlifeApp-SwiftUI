//
//  AnimalModel.swift
//  Wildlife
//
//  Created by Joseph on 7/17/23.
//

import Foundation

struct Animal: Decodable, Identifiable {
    let id: String
    let name: String
    let headline: String
    let description: String
    let link: String
    let image: String
    let gallery: [String]
    let fact: [String]
    
}