//
//  AppTabView.swift
//  Pill Assistant
//
//  Created by Juan Diego Ocampo on 17/03/22.
//

import SwiftUI

struct AppTabView: View {
    
    @StateObject var viewModel = AppTabViewModel()
    
    var body: some View {
        TabView {
            TestScreen()
                .tabItem { Label("Home", systemImage: "house.circle.fill") }
            Text("Hello World")
                .tabItem { Label("Profile", systemImage: "person.circle.fill") }
        }
        .onAppear(perform: viewModel.checkForActiveSession)
        .fullScreenCover(isPresented: $viewModel.showLoginScreen) { LoginView() }
    }
}

struct AppTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabView()
    }
}
