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
    
    var body: some View {
        Button("Sign Out") {
            do {
                try Auth.auth().signOut()
                returnToLoginView.toggle()
            } catch {
                print(error.localizedDescription)
            }
        }
        .fullScreenCover(isPresented: $returnToLoginView) { LoginView() }
    }
}

struct TestScreen_Previews: PreviewProvider {
    static var previews: some View {
        TestScreen()
    }
}
