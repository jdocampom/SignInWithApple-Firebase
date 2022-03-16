//
//  TestScreen.swift
//  Pill Assistant
//
//  Created by Juan Diego Ocampo on 16/03/22.
//

import SwiftUI
import Firebase

struct TestScreen: View {
    
    @State private var returnToLoginView = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button("Sign Out") {
            do {
                try Auth.auth().signOut()
                presentationMode.wrappedValue.dismiss()
//                returnToLoginView.toggle()
            } catch let error {
                print(error.localizedDescription)
            }
        }
//        .fullScreenCover(isPresented: $returnToLoginView) { LoginView() }
    }
}

struct TestScreen_Previews: PreviewProvider {
    static var previews: some View {
        TestScreen()
    }
}
