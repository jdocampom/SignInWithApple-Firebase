//
//  TextFields.swift
//  Pill Assistant
//
//  Created by Juan Diego Ocampo on 15/03/22.
//

import SwiftUI

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

struct TextFields_Previews: PreviewProvider {
    static var previews: some View {
        EmailTextField(with: .constant("Email")).fitPreviewOnLightMode()
        EmailTextField(with: .constant("Email")).fitPreviewOnDarkMode()
        PasswordTextField(with: .constant("Password")).fitPreviewOnLightMode()
        PasswordTextField(with: .constant("Password")).fitPreviewOnDarkMode()
    }
}
