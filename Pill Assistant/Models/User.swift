//
//  User.swift
//  Pill Assistant
//
//  Created by Juan Diego Ocampo on 16/03/22.
//

import Foundation

struct User: Identifiable {
    let id = UUID()
    let email: String
    let password: String
}
