//
//  SignInScreen.swift
//  Pill Assistant
//
//  Created by Juan Diego Ocampo on 15/03/22.
//

import SwiftUI
import CoreData

struct SignInScreen: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        Group {
            VStack {
                Spacer()
                ZStack {
                    GradientBackground()
                    ZStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 20) {
                            Spacer().frame(height: 48)
                            LoginCardTitle(text: "Sign In")
                            LoginCardLabel(text: "Keep track of your medicine cabinet and never miss a dose again!")
                            EmailTextField(with: $email)
                            PasswordTextField(with: $password)
                            PAButton(text: "Sign In", action: signInTapped)
                            LoginDivider()
                            SignInWithAppleButton(context: .signIn, action: signInWithAppleTapped)
                            Divider()
                            PARedirectButton(label: "Don't have an account?", text: "Sign Up", action: redirectToSignUpTapped)
                        }
                        .padding()
                        .frame(width: UIScreen.main.bounds.width - 32)
                        .background(Color(.secondarySystemBackground))
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .opacity(0.85)
                        .shadow(radius: 250)
                        OverlayedAppIcon()
                    }
                }
                Spacer()
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

extension SignInScreen {
    func signInTapped() { print("signInTapped") }
    func signInWithAppleTapped() { print("signInWithAppleTapped") }
    func redirectToSignUpTapped() { SignUpScreen() }
}

struct SignInScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignInScreen()
            .preferredColorScheme(.light)
            .statusBar(hidden: false)
        SignInScreen()
            .preferredColorScheme(.light)
            .statusBar(hidden: false)
    }
}
