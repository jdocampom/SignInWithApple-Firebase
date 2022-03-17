//
//  String+Ext.swift
//  Pill Assistant
//
//  Created by Juan Diego Ocampo on 17/03/22.
//

import Foundation

extension String {
    
    var isValidEmail: Bool {
        let emailFormat         = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate      = NSPredicate(format: "SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: self)
    }
    
    var isBlank: Bool {
        if self.trimmingCharacters(in: .whitespaces).isEmpty {
            return true
        } else {
            return false
        }
        
    }
    
}
