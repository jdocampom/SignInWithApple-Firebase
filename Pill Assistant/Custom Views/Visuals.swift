//
//  Visuals.swift
//  Pill Assistant
//
//  Created by Juan Diego Ocampo on 15/03/22.
//

import SwiftUI

struct OverlayedAppIcon: View {
    var body: some View {
        Image("app-icon")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 128, height: 128)
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .offset(y: -64)
            .shadow(radius: 32)
    }
}

struct GradientBackground: View {
    var body: some View {
        LinearGradient(colors: [.paletteDarkBlue, .paletteMediumBlue, .paletteLightBlue, .paletteMediumRed, .paletteDarkRed], startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
            .blur(radius: 64, opaque: true)
    }
}

/// MARK: - SwiftUI Previews

struct Visuals_Previews: PreviewProvider {
    static var previews: some View {
        OverlayedAppIcon().fitPreviewOnLightMode()
            .offset(y:64)
            .previewLayout(.fixed(width: 150, height: 150))
        OverlayedAppIcon().fitPreviewOnDarkMode()
            .offset(y:64)
            .previewLayout(.fixed(width: 150, height: 150))
        GradientBackground().fitPreviewOnLightMode()
        GradientBackground().fitPreviewOnDarkMode()
    }
}
