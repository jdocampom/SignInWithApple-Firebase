//
//  CustomModifiers.swift
//  Pill Assistant
//
//  Created by Juan Diego Ocampo on 15/03/22.
//

import SwiftUI

struct AutomaticPreviewLayoutLightMode: ViewModifier {
    
    var colorScheme: ColorScheme = .light
    
    func body(content: Content) -> some View {
        content
            .padding()
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(colorScheme)
    }
    
}

struct AutomaticPreviewLayoutDarkMode: ViewModifier {
    
    var colorScheme: ColorScheme = .dark
    
    func body(content: Content) -> some View {
        content
            .padding()
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(colorScheme)
    }
    
}
