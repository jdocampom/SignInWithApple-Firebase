//
//  View+Ext.swift
//  Pill Assistant
//
//  Created by Juan Diego Ocampo on 15/03/22.
//

import SwiftUI

extension View {
    
    func fitPreviewOnLightMode()  -> some View { self.modifier(AutomaticPreviewLayoutLightMode()) }
    func fitPreviewOnDarkMode()   -> some View { self.modifier(AutomaticPreviewLayoutDarkMode()) }
        
    func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        
    }
    
    func embedInScrollView() -> some View {
        GeometryReader { geometry in
            ScrollView {
                self.frame(minHeight: geometry.size.height, maxHeight: .infinity)
            }
        }
    }
    
}
