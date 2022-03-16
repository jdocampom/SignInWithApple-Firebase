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
        
        @Published var email: String = ""
        @Published var password: String = ""
        
        @Published var showingSignUpScreen = true
        @Published var redirectToHomeScreen = false
        
        @Published var alertItem: AlertItem?
        
        internal func signUpUser() {
            generator.selectionChanged()
            Auth.auth().createUser(withEmail: self.email, password: self.password) { [self] result, error in
                guard error == nil else {
                    let errorMessage =  String(describing: error!.localizedDescription)
                    print("❌ ERROR - SignUpScreenViewModel - signUp(): \(errorMessage) ❌")
                    AlertContext.errorCreatingProfile.message = Text("\n\(errorMessage)")
                    HapticManager.playErrorHaptic()
                    alertItem = AlertContext.errorCreatingProfile
                    return
                }
                print("✅ USER SIGNED UP SUCCESSFULLY - SignUpScreenViewModel - signUp() ✅")
                HapticManager.playSuccessHaptic()
            }
        }
        
        internal func logInUser() {
            generator.selectionChanged()
            print("logInUser")
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
        
        internal func signUpWithAppleTapped() { print("signUpWithAppleTapped") }
        internal func resetPasswordTapped() { print("resetPasswordTapped") }
        
    }
    
}
