//
//  Visuals.swift
//  Pill Assistant
//
//  Created by Juan Diego Ocampo on 15/03/22.
//

import SwiftUI

struct LoginCardTitle: View {
    var text: String
    var body: some View {
        HStack{
            Spacer()
            Text(text)
                .font(.title).bold()
            Spacer()
        }
    }
}

struct LoginCardLabel: View {
    var text: String
    var body: some View {
        Text(text)
            .multilineTextAlignment(.center)
            .opacity(0.85)
            .minimumScaleFactor(0.75)
            .lineLimit(2)
            .padding(.horizontal)
    }
}

struct LoginDivider: View {
    var body: some View {
        HStack {
            Spacer()
            Text("or")
                .font(.subheadline)
                .opacity(0.85)
            Spacer() }
    }
}

struct LoginDivider_Previews: PreviewProvider {
    static var previews: some View {
        LoginCardTitle(text: "Title").fitPreviewOnLightMode()
        LoginCardTitle(text: "Title").fitPreviewOnDarkMode()
        LoginCardLabel(text: "Title").fitPreviewOnLightMode()
        LoginCardLabel(text: "Title").fitPreviewOnDarkMode()
        LoginDivider().fitPreviewOnLightMode()
        LoginDivider().fitPreviewOnDarkMode()
    }
}
