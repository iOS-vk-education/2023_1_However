//
//  EmojiComplexity.swift
//  Odnako
//
//  Created by User on 24.12.2023.
//

import Foundation

enum EmojiComplexity: String {
    case sleeping = "😴"
    case winking = "😉"
    case surprised = "😳"
    case fire = "🔥"
    case skull = "☠️"

    func complexityValue() -> Int {
        switch self {
        case .sleeping:
            return 1
        case .winking:
            return 2
        case .surprised:
            return 3
        case .fire:
            return 4
        case .skull:
            return 5
        }
    }
    
    static func getEmojiFromValue(id: Int) -> String {
        switch id {
        case 0:
            return EmojiComplexity.sleeping.rawValue
        case 1:
            return EmojiComplexity.winking.rawValue
        case 2:
            return EmojiComplexity.surprised.rawValue
        case 3:
            return EmojiComplexity.fire.rawValue
        case 4:
            return EmojiComplexity.skull.rawValue
        default:
            return ""
        }
    }
}
