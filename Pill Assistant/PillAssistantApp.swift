//
//  PillAssistantApp.swift
//  Pill Assistant
//
//  Created by Juan Diego Ocampo on 15/03/22.
//

import SwiftUI

@main
struct PillAssistantApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            SignUpScreen()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
