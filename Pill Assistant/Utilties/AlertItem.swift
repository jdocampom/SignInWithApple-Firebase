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
    let message         : Text
    let dismissButton   : Alert.Button
    
    var alert: Alert {
        Alert(title: title, message: message, dismissButton: dismissButton)
    }
    
}

struct AlertContext {
    
    /// Tag: Login View Alerts
    static let profileCreatedSuccessfully = AlertItem(title: Text("􀁣").font(.largeTitle).foregroundColor(.green),
                                                      message: Text("Your account has been created successfully."),
                                                      dismissButton: .default(Text("Dismiss")))
    /// Tag: MapView Errors
    static let errorCreatingProfile       = AlertItem(title: Text("􀁡").font(.largeTitle).foregroundColor(.red),
                                                      message: Text("We were unable to create your account at this time. \n\nPlease try again."),
                                                      dismissButton: .default(Text("Dismiss")))

}
