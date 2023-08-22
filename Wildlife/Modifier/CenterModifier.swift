//
//  CenterModifier.swift
//  Wildlife
//
//  Created by Joseph on 8/22/23.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack{
            Spacer()
            content
            Spacer()
        }
    }
}
