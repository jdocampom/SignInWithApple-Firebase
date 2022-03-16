//
//  Buttons.swift
//  Pill Assistant
//
//  Created by Juan Diego Ocampo on 15/03/22.
//

import AuthenticationServices
import SwiftUI

struct PAButton: View {
    private let generator = UISelectionFeedbackGenerator()
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
                    .foregroundColor(Color.white)
                    .background(Color.red)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .onTapGesture { generator.selectionChanged() }
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

struct LoginButton: View {
    var label: String
    var body: some View {
        HStack {
            Spacer()
            Text(label).bold()
                .padding()
                .font(.title3)
                .frame(width: 280, height: 44)
                .foregroundColor(Color.white)
                .background(Color.red)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            Spacer()
        }
    }
}

struct SignUpWithAppleButtonView: View {
    var appearance: ColorScheme
    var body: some View {
        SignInWithAppleButton(
            .signUp,
            onRequest: {_ in },
            onCompletion: {_ in }
        )
        .frame(width: 280, height: 44)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .signInWithAppleButtonStyle(appearance == .dark ? .white : .black)
    }
}

struct SignInWithAppleButtonView: View {
    var appearance: ColorScheme
    var body: some View {
        SignInWithAppleButton(
            .signIn,
            onRequest: {_ in },
            onCompletion: {_ in }
        )
        .frame(width: 280, height: 44)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .signInWithAppleButtonStyle(appearance == .dark ? .white : .black)
    }
}

/// MARK: - SwiftUI Previews

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        PAButton(text: "Button", action: {}).fitPreviewOnLightMode()
        PAButton(text: "Button", action: {}).fitPreviewOnDarkMode()
        PARedirectButton(label: "Label Text", text: "Button", action: {}).fitPreviewOnLightMode()
        PARedirectButton(label: "Label Text", text: "Button", action: {}).fitPreviewOnDarkMode()
    }
}
