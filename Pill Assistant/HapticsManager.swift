//
//  HapticsManager.swift
//  Pill Assistant
//
//  Created by Juan Diego Ocampo on 16/03/22.
//

import UIKit

struct HapticManager {
    static func playSuccessHaptic() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
    
    static func playErrorHaptic() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.error)
    }
}
