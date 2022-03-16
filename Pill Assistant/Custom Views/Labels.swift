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
        LoginCardTitle(text: "Title")
            .padding()
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.light)
        LoginCardTitle(text: "Title")
            .padding()
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
        LoginCardLabel(text: "Title")
            .padding()
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.light)
        LoginCardLabel(text: "Title")
            .padding()
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
        LoginDivider()
            .padding()
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.light)
        LoginDivider()
            .padding()
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
