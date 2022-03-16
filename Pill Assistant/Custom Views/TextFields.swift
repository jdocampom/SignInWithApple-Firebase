//
//  TextFields.swift
//  Pill Assistant
//
//  Created by Juan Diego Ocampo on 15/03/22.
//

import SwiftUI

struct EmailTextField: View {
    @Binding var email: String
    private let generator = UISelectionFeedbackGenerator()
    var body: some View {
        HStack(spacing: 12) {
            HStack {
                Spacer()
                Image(systemName: "envelope.open.fill")
                Spacer()
            }
            .frame(width: 21)
            TextField("Email Address", text: $email)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .textContentType(.emailAddress)
                .onTapGesture { generator.selectionChanged() }
        }
        .frame(height: 48)
        .padding(.leading)
    }
    
    init(with: Binding<String>) {
        self._email = with
    }
    
}

struct PasswordTextField: View {
    @Binding var password: String
    private let generator = UISelectionFeedbackGenerator()
    var body: some View {
        HStack(spacing: 12) {
            HStack {
                Spacer()
                Image(systemName: "key.fill")
                Spacer()
            }
            .frame(width: 21)
            SecureField("Password", text: $password)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .textContentType(.password)
                .onTapGesture { generator.selectionChanged() }
        }
        .frame(height: 48)
        .padding(.leading)
    }
    
    init(with: Binding<String>) {
        self._password = with
    }
    
}

/// MARK: - SwiftUI Previews

struct TextFields_Previews: PreviewProvider {
    static var previews: some View {
        EmailTextField(with: .constant("Email")).fitPreviewOnLightMode()
        EmailTextField(with: .constant("Email")).fitPreviewOnDarkMode()
        PasswordTextField(with: .constant("Password")).fitPreviewOnLightMode()
        PasswordTextField(with: .constant("Password")).fitPreviewOnDarkMode()
    }
}
