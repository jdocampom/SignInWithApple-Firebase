//
//  SignUpScreenView.swift
//  Pill Assistant
//
//  Created by Juan Diego Ocampo on 15/03/22.
//

import SwiftUI
import CoreData
import Firebase

/// MARK: - SignUpScreen - Main SwiftUI View

struct LoginView: View {
    
    @Environment(\.colorScheme) private var colorScheme
    @StateObject private var viewModel = LoginViewModel()

    var body: some View {
        ZStack(alignment: .center) {
            viewModel.showingSignUpScreen ? GradientBackground() : GradientBackground()
            ZStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 10) {
                    Group {
                        Spacer().frame(height: 48)
                        LoginCardTitle(text: viewModel.showingSignUpScreen ? "Sign Up" : "Sign In")
                        if viewModel.showingSignUpScreen {
                            LoginCardLabel(text: "Keep track of your medicine cabinet and never miss a dose again!")
                        }
                        EmailTextField(with: $viewModel.email)
                        PasswordTextField(with: $viewModel.password)
                    }
                    Group {
                        Button {
                            viewModel.showingSignUpScreen ? viewModel.signUpUser() : viewModel.logInUser()
                        } label: {
                            LoginButton(label: viewModel.showingSignUpScreen ? "Create Account" : "Log In")
                        }
                        LoginDivider()
                        HStack {
                            Spacer()
                            Button {
                                viewModel.signInWithAppleTapped()
                            } label: {
                                SignInWithAppleButtonView(appearance: colorScheme)
                            }
                            Spacer()
                        }
                        Divider()
                        if !viewModel.showingSignUpScreen {
                            PARedirectButton(label: "Forgot your password?", text: "Reset Password", action: viewModel.resetPasswordTapped)
                            Spacer().frame(height: 6)
                        }
                        PARedirectButton(label: viewModel.showingSignUpScreen ? "Already have an account?" : "Don't have an account?", text: viewModel.showingSignUpScreen ? "Log In" : "Register") {
                            withAnimation(.linear(duration: 0.75)) {
                                viewModel.showingSignUpScreen.toggle()
                                viewModel.rotationAngle += 180
                            }
                        }
                    }
                }
                .rotation3DEffect(Angle(degrees: viewModel.rotationAngle), axis: (x: 0.0, y: 1.0, z: 0.0))
                .padding()
                .frame(width: 280+64)
                .background(Color(.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .opacity(0.85)
                .shadow(radius: 250)
                .rotation3DEffect(Angle(degrees: viewModel.rotationAngle), axis: (x: 0.0, y: 1.0, z: 0.0))
                OverlayedAppIcon()
            }
        }
        .alert(item: $viewModel.alertItem, content: { $0.alert })
        .fullScreenCover(isPresented: $viewModel.redirectToHomeScreen) { TestScreen() }
        .onAppear(perform: viewModel.checkForActiveSession)
    }
}

/// MARK: - SwiftUI Previews

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .preferredColorScheme(.light)
            .statusBar(hidden: false)
        LoginView()
            .preferredColorScheme(.dark)
            .statusBar(hidden: false)
    }
}
