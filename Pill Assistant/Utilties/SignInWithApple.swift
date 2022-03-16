//
//  SignInWithApple.swift
//  Pill Assistant
//
//  Created by Juan Diego Ocampo on 16/03/22.
//

import Foundation
import AuthenticationServices
import CryptoKit
import FirebaseAuth

final public class SignInWithApple: NSObject {
    
    private var currentNonce: String?
    
    public func signInWithApple() {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.email, .fullName]
        let nonce = randomNonceString()
        currentNonce = nonce
        request.nonce = sha256(currentNonce!)
        
        let authorisationController = ASAuthorizationController(authorizationRequests: [request])
        authorisationController.delegate = self
        authorisationController.performRequests()
    }
    
    private func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap {
            String(format: "%02x", $0)
        }.joined()
        
        return hashString
    }
    
    private func randomNonceString(length: Int = 32) -> String {
        precondition(length > 0)
        let charset: [Character] =
        Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
        var result = ""
        var remainingLength = length
        
        while remainingLength > 0 {
            let randoms: [UInt8] = (0 ..< 16).map { _ in
                var random: UInt8 = 0
                let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
                if errorCode != errSecSuccess {
                    fatalError("Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)")
                }
                return random
            }
            randoms.forEach { random in
                if remainingLength == 0 {
                    return
                }
                
                if random < charset.count {
                    result.append(charset[Int(random)])
                    remainingLength -= 1
                }
            }
        }
        return result
    }
    
}

extension SignInWithApple: ASAuthorizationControllerDelegate {
    
    public func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            guard let nonce = self.currentNonce else {
                print("Invalid state: A login callback was receivedm but no login request has sent.")
                return
            }
            guard let appleIDToken = appleIDCredential.identityToken else {
                print("Unable to fetch identity token.")
                return
            }
            guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
                print("Unable to serialize token string from data.")
                return
            }
            let credential = OAuthProvider.credential(withProviderID: "apple.com", idToken: idTokenString, rawNonce: nonce)
            Auth.auth().signIn(with: credential) { result, error in
                guard error == nil else {
                    let errorMessage =  String(describing: error!.localizedDescription)
                    print("❌ ERROR - SignInWithApple: \(errorMessage) ❌")
                    HapticManager.playErrorHaptic()
                    return
                }
                HapticManager.playSuccessHaptic()
            }
        }
    }
    
}
