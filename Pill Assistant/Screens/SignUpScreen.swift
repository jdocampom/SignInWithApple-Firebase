//
//  SignUpScreen.swift
//  Pill Assistant
//
//  Created by Juan Diego Ocampo on 15/03/22.
//

import SwiftUI
import CoreData

/// MARK: - SignUpScreen - Main SwiftUI View

struct SignUpScreen: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        
        ZStack(alignment: .center) {
            GradientBackground()
            ZStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 10) {
                    Spacer().frame(height: 48)
                    LoginCardTitle(text: "Sign Up")
                    LoginCardLabel(text: "Keep track of your medicine cabinet and never miss a dose again!")
                    EmailTextField(with: $email)
                    PasswordTextField(with: $password)
                    PAButton(text: "Sign Up", action: signUpTapped)
                    HStack { Spacer(); Text("or").opacity(0.85).font(.subheadline) ; Spacer() }
                    SignInWithAppleButton(context: .signUp, action: signUpWithAppleTapped)
                    Divider()
                    PARedirectButton(label: "Already have an account?", text: "Sign In", action: redirectToSignInTapped)
                }
                .padding()
                .frame(width: 280+64)
                .background(Color(.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .opacity(0.85)
                .shadow(radius: 250)
                OverlayedAppIcon()
            }
        }
    }
}

/// MARK: - SignUpScreen Methods

extension SignUpScreen {
    func signUpTapped() { print("signUpTapped") }
    func signUpWithAppleTapped() { print("signUpWithAppleTapped") }
    func redirectToSignInTapped() { print("redirectToSignInTapped") }
}

/// MARK: - SwiftUI Previews

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpScreen()
            .preferredColorScheme(.light)
            .statusBar(hidden: false)
        SignUpScreen()
            .preferredColorScheme(.dark)
            .statusBar(hidden: false)
    }
}
