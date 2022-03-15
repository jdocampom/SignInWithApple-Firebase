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
                            SignUpTitle(text: "Sign In")
                            SignUpLabel(text: "Keep track of your medicine cabinet and never miss a dose again!")
                            EmailTextField(with: $email)
                            PasswordTextField(with: $password)
                            SignUpButton(action: signInTapped)
                            HStack { Spacer(); Text("or").opacity(0.85).font(.subheadline) ; Spacer() }
                            SignInWithAppleButton(action: signInWithAppleTapped)
                            Divider()
                            RedirectToSignUpViewButton(action: redirectToSignUpTapped)
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
    }
}

struct SignInButton: View {
    var action: () -> Void
    var body: some View {
        HStack {
            Spacer()
            Button(action: action) {
                Text("Sign In").bold()
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

struct RedirectToSignUpViewButton: View {
    var action: () -> Void
    var body: some View {
        HStack{
            Spacer()
            Text("Don't have an account?")
                .font(.subheadline)
                .opacity(0.85)
            Button(action: action) {
                Text("Sign Up")
                    .foregroundColor(Color.red)
                    .font(.subheadline)
            }
            Spacer()
        }
    }
}
