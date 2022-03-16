//
//  SignUpScreenViewModel.swift
//  Pill Assistant
//
//  Created by Juan Diego Ocampo on 16/03/22.
//

import Firebase
import SwiftUI

extension LoginView {
    
    final class LoginViewModel: ObservableObject {
        
        private let generator = UISelectionFeedbackGenerator()
        
        @Published var rotationAngle = 0.0
        
        @Published var email: String = ""
        @Published var password: String = ""
        
        @Published var showingSignUpScreen = true
        @Published var redirectToHomeScreen = false
        
        @Published var alertItem: AlertItem?
        
        @Published var signInWithAppleManager = SignInWithApple()
        
        internal func signUpUser() {
            generator.selectionChanged()
            Auth.auth().createUser(withEmail: self.email, password: self.password) { [self] result, error in
                guard error == nil else {
                    let errorMessage =  String(describing: error!.localizedDescription)
                    print("❌ ERROR - LoginViewModel - signUpUser(): \(errorMessage) ❌")
                    AlertContext.errorCreatingProfile.message = Text("\n\(errorMessage)")
                    HapticManager.playErrorHaptic()
                    alertItem = AlertContext.errorCreatingProfile
                    return
                }
                print("✅ USER SIGNED UP SUCCESSFULLY - LoginViewModel - signUpUser() ✅")
                HapticManager.playSuccessHaptic()
            }
        }
        
        internal func logInUser() {
            generator.selectionChanged()
            Auth.auth().signIn(withEmail: self.email, password: self.password) { [self] result, error in
                guard error == nil else {
                    let errorMessage =  String(describing: error!.localizedDescription)
                    print("❌ ERROR - LoginViewModel - logInUser(): \(errorMessage) ❌")
                    AlertContext.errorCreatingProfile.message = Text("\n\(errorMessage)")
                    HapticManager.playErrorHaptic()
                    alertItem = AlertContext.errorCreatingProfile
                    return
                }
                print("✅ USER LOGGED IN SUCCESSFULLY - LoginViewModel - logInUser() ✅")
                HapticManager.playSuccessHaptic()
            }
        }
        
        internal func checkForActiveSession() {
            Auth.auth().addStateDidChangeListener { [self] auth, user in
                if user != nil {
                    redirectToHomeScreen = true
                } else {
                    redirectToHomeScreen = false
                }
            }
        }
        
        internal func signUpWithAppleTapped() { signInWithAppleManager.signInWithApple() }
        internal func signInWithAppleTapped() { signInWithAppleManager.signInWithApple() }
        internal func resetPasswordTapped() { print("resetPasswordTapped") }
        
    }
    
}
