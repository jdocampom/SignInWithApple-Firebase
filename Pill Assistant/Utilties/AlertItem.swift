//
//  AlertItem.swift
//  Pill Assistant
//
//  Created by Juan Diego Ocampo on 16/03/22.
//

import Foundation

import SwiftUI

struct AlertItem: Identifiable {
    
    let id              = UUID()
    let title           : Text
    var message         : Text
    let dismissButton   : Alert.Button
    
    var alert: Alert {
        Alert(title: title, message: message, dismissButton: dismissButton)
    }
    
}

struct AlertContext {
    
    /// Tag: Login View Alerts
    static let profileCreatedSuccessfully = AlertItem(title: Text("Account Created").font(.title2).bold(),
                                                      message: Text("\nYour account has been created successfully."),
                                                      dismissButton: .default(Text("OK")))
    
    static var errorCreatingProfile       = AlertItem(title: Text("Error Creating Account").font(.title2).bold(),
                                                      message: Text("\nWe were unable to create your account at this time. \n\nPlease try again."),
                                                      dismissButton: .default(Text("OK")))

}
