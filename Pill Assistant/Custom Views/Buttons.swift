//
//  Buttons.swift
//  Pill Assistant
//
//  Created by Juan Diego Ocampo on 15/03/22.
//

import SwiftUI

enum SignInWithAppleButtonContext {
    case signIn, signUp
}

struct PAButton: View {
    var text: String
    var action: () -> Void
    var body: some View {
        HStack {
            Spacer()
            Button(action: action) {
                Text(text).bold()
                    .padding()
                    .font(.title3)
                    .frame(width: 280, height: 44)
                //                    .frame(width: UIScreen.main.bounds.width - 64, height:  48)
                    .foregroundColor(Color.white)
                    .background(Color.red)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            Spacer()
        }
    }
}

struct PARedirectButton: View {
    var label: String
    var text: String
    var action: () -> Void
    var body: some View {
        HStack{
            Spacer()
            Text(label)
                .font(.subheadline)
                .opacity(0.85)
            Button(action: action) {
                Text(text)
                    .foregroundColor(Color.red)
                    .font(.subheadline)
            }
            Spacer()
        }
    }
}

struct SignInWithAppleButton: View {
    @Environment(\.colorScheme) var colorScheme
    var context: SignInWithAppleButtonContext
    var action: () -> Void
    var body: some View {
        HStack {
            Spacer()
            Button(action: action) {
                Label(context == .signIn ? "Sign in with Apple" : "Sign up with Apple", systemImage: "applelogo")
                    .padding()
                    .font(.title3)
                    .frame(width: 280, height: 44)
                    .foregroundColor(colorScheme == .light ? Color.white: Color.black)
                    .background(colorScheme == .light ? Color.black: Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            Spacer()
        }
    }
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        PAButton(text: "Button", action: {})
            .padding()
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.light)
        PAButton(text: "Button", action: {})
            .padding()
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
        PARedirectButton(label: "Label Text", text: "Button", action: {})
            .padding()
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.light)
        PARedirectButton(label: "Label Text", text: "Button", action: {})
            .padding()
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
        SignInWithAppleButton(context: .signIn, action: {})
            .padding()
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.light)
        SignInWithAppleButton(context: .signUp, action: {})
            .padding()
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
