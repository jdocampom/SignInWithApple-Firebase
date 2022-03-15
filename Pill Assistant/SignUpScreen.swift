//
//  SignUpScreen.swift
//  Pill Assistant
//
//  Created by Juan Diego Ocampo on 15/03/22.
//

import SwiftUI
import CoreData

struct SignUpScreen: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack(alignment: .center) {
            GradientBackground()
            ZStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 20) {
                    Spacer().frame(height: 48)
                    SignUpTitle(text: "Sign Up")
                    SignUpLabel(text: "Keep track of your medicine cabinet and never miss a dose again!")
                    EmailTextField(with: $email)
                    PasswordTextField(with: $password)
                    SignUpButton(action: signUpTapped)
                    HStack { Spacer(); Text("or").opacity(0.85).font(.subheadline) ; Spacer() }
                    SignInWithAppleButton(action: signUpWithAppleTapped)
                    Divider()
                    RedirectToSignInViewButton(action: redirectToSignInTapped)
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

extension SignUpScreen {
    func signUpTapped() { print("signUpTapped") }
    func signUpWithAppleTapped() { print("signUpWithAppleTapped") }
    func redirectToSignInTapped() { SignInScreen() }
}

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

struct EmailTextField: View {
    @Binding var email: String
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "envelope.open.fill")
            TextField("Email Address", text: $email)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .textContentType(.emailAddress)
        }
        .frame(height: 48)
        .padding(.leading)
    }
    init(with: Binding<String>) { self._email = with }
}

struct PasswordTextField: View {
    @Binding var password: String
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "key.fill")
            SecureField("Password", text: $password)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .textContentType(.password)
        }
        .frame(height: 48)
        .padding(.leading)
    }
    init(with: Binding<String>) { self._password = with }
}

struct SignUpLabel: View {
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

struct SignInWithAppleButton: View {
    @Environment(\.colorScheme) var colorScheme
    var action: () -> Void
    var body: some View {
        HStack {
            Spacer()
            Button(action: action) {
                Label("Sign in with Apple", systemImage: "applelogo")
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

struct SignUpButton: View {
    var action: () -> Void
    var body: some View {
        HStack {
            Spacer()
            Button(action: action) {
                Text("Sign Up").bold()
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

struct RedirectToSignInViewButton: View {
    var action: () -> Void
    var body: some View {
        HStack{
            Spacer()
            Text("Already have an account?")
                .font(.subheadline)
                .opacity(0.85)
            Button(action: action) {
                Text("Sign In")
                    .foregroundColor(Color.red)
                    .font(.subheadline)
            }
            Spacer()
        }
    }
}

struct SignUpTitle: View {
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
