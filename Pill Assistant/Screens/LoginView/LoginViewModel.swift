//
//  SignUpScreenViewModel.swift
//  Pill Assistant
//
//  Created by Juan Diego Ocampo on 16/03/22.
//

import Firebase
import SwiftUI

/// `LoginViewModel` class is encapsulated inside an extension of the `LoginView` struct so it can be accessed only scope within the scope of `LoginView`.

extension LoginView {
    
    /// Tag: LoginViewModel class: Controls of the logic and data flow of the LoginView Screen.

    final class LoginViewModel: ObservableObject {
        
        /// MARK: - ViewModel Properties
        
        @Published var email                  = ""
        @Published var password               = ""
        @Published var signInWithAppleManager = SignInWithApple()
        @Published var showingSignUpScreen    = true
        @Published var redirectToHomeScreen   = false
        @Published var rotationAngle          = 0.0
        @Published var alertItem              : AlertItem?
        
        private let generator = UISelectionFeedbackGenerator()
        
        /// MARK: - ViewModel Methods
        
        /// Tag: Firebase User Registration
        internal func signUpUser() {
            generator.selectionChanged()
            Auth.auth().createUser(withEmail: self.email, password: self.password) { [self] result, error in
                guard error == nil else {
                    let errorMessage =  String(describing: error!.localizedDescription)
                    print("❌ ERROR - LoginViewModel - signUpUser(): \(errorMessage) ❌")
                    AlertContext.errorCreatingProfile.message = Text("\(errorMessage)")
                    HapticManager.playErrorHaptic()
                    alertItem = AlertContext.errorCreatingProfile
                    return
                }
                print("✅ USER SIGNED UP SUCCESSFULLY - LoginViewModel - signUpUser() ✅")
                self.email = ""
                self.password = ""
                HapticManager.playSuccessHaptic()
            }
        }
        
        /// Tag: Firebase User Login
        internal func logInUser() {
            generator.selectionChanged()
            Auth.auth().signIn(withEmail: self.email, password: self.password) { [self] result, error in
                guard error == nil else {
                    let errorMessage =  String(describing: error!.localizedDescription)
                    print("❌ ERROR - LoginViewModel - logInUser(): \(errorMessage) ❌")
                    AlertContext.errorCreatingProfile.message = Text("\(errorMessage)")
                    HapticManager.playErrorHaptic()
                    alertItem = AlertContext.errorCreatingProfile
                    return
                }
                print("✅ USER LOGGED IN SUCCESSFULLY - LoginViewModel - logInUser() ✅")
                self.email = ""
                self.password = ""
                HapticManager.playSuccessHaptic()
            }
        }
        
        /// Tag: Firebase User Registration using Sign in with Apple
        internal func signInWithAppleTapped() {
            signInWithAppleManager.signInWithApple()
        }
        
        /// Tag: Firebase User Registration
        internal func resetPasswordTapped() {
            Auth.auth().sendPasswordReset(withEmail: self.email) { [self] error in
                guard error == nil else {
                    let errorMessage =  String(describing: error!.localizedDescription)
                    print("❌ ERROR - LoginViewModel - resetPasswordTapped(): \(errorMessage) ❌")
                    AlertContext.errorSendingRecoveryEmail.message = Text("\(errorMessage)")
                    HapticManager.playErrorHaptic()
                    alertItem = AlertContext.errorSendingRecoveryEmail
                    return
                }
                AlertContext.passwordRecoveryEmailSent.message = Text("An email with instructions to reset your password has been sent to \(self.email). \n\nPlease check your inbox and follow the instructions.")
                HapticManager.playSuccessHaptic()
                alertItem = AlertContext.passwordRecoveryEmailSent
            }
        }
        
        /// MARK: - Helper Methods
        
        /// Tag: This function checks if the email address is in a correct fotmat.
        private func validateEmail(_ email: String) -> Bool {
            if email.isBlank {
                return false
            }
            if email.isValidEmail {
                return true
            } else {
                return false
            }
        }
        
        /// Tag: This function checks if the password contains 8 characters of more and if at least two of them are a digit and uppercase character.
        private func validatePassword(_ password: String) -> Bool {
            let uppercaseLetters = "ABCDEFGHIJKLMNOPQRSTUVXYZ"
            let digits = "0123456789"
            if password.isBlank { return false }
            if password.count < 8 { return false }
            if !password.contains(uppercaseLetters) { return false }
            if !password.contains(digits) { return false }
            return true
        }
        
        /// Tag: This function checks if both email and password passed their respective input validation checks
        private func inputValidationCheck() -> Bool {
            if (validateEmail(self.email) == true) && (validatePassword(self.password) == true) {
                return true
            } else {
                return false
            }
        }
        
    }
    
}
