//
//  VideoModel.swift
//  Wildlife
//
//  Created by Joseph on 7/18/23.
//

import Foundation


struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    var thumbNail: String {
        return "video-\(id)"
    }
}
