//
//  HapticManager.swift
//  SimpleCookieClicker
//
//  Created by Ohara Yoji on 2025/01/20.
//

import SwiftUI

public enum ImpactFeedbackStyle: Int {
    case light = 0
    case medium = 1
    case heavy = 2
    case soft = 3
    case rigid = 4

    var value: UIImpactFeedbackGenerator.FeedbackStyle {
        return .init(rawValue: rawValue)!
    }

}

public enum NotificationFeedbackType: Int {
    case success
    case failure
    case error

    var value: UINotificationFeedbackGenerator.FeedbackType {
        return .init(rawValue: rawValue)!
    }
}

public enum Haptic {
    case impact(_ style: ImpactFeedbackStyle, intensity: CGFloat? = nil)
    case notification(_ type: NotificationFeedbackType)
}

public final class HapticManager {

    public static let shared = HapticManager()
    private init() {}
    private var impactFeedbackGenerator: UIImpactFeedbackGenerator?
    private var notificationFeedbackGenerator: UINotificationFeedbackGenerator?

    public func play(_ haptic: Haptic) {
        switch haptic {
        case .impact(let style, let intensity):
            impactFeedbackGenerator = UIImpactFeedbackGenerator(style: style.value)
            impactFeedbackGenerator?.prepare()

            if let intensity = intensity {
                impactFeedbackGenerator?.impactOccurred(intensity: intensity)
            } else {
                impactFeedbackGenerator?.impactOccurred()
            }
            impactFeedbackGenerator = nil

        case .notification(let type):
            notificationFeedbackGenerator = UINotificationFeedbackGenerator()
            notificationFeedbackGenerator?.prepare()
            notificationFeedbackGenerator?.notificationOccurred(type.value)
            notificationFeedbackGenerator = nil
        }
    }
}

