//
//  UIColor+Extension.swift
//  Odnako
//
//  Created by User on 18.12.2023.
//

import Foundation
import UIKit

extension UIColor{
    static let customBackGroundColor = UIColor.white
    static let customDeadlineMainColor = UIColor(red: 224/255, green: 193/255, blue: 255/255, alpha: 1.0)
    static let customDeadlineCellColor = UIColor(red: 210/255, green: 172/255, blue: 249/255, alpha: 1.0)
    static let customTabBarColor = UIColor(red: 197/255, green: 168/255, blue: 228/255, alpha: 1.0)
    static let customAccentColor = UIColor(red: 175/255, green: 120/255, blue: 234/255, alpha: 1.0)
    static let customDarkPurpleColor = UIColor.purple // темно-фиолетовый
    static let customLightPurpleColor = UIColor(red: 190/255, green: 179/255, blue: 228/255, alpha: 1.0) // фиолетовый
    static let customGreenCompletedColor = UIColor(red: 161/255, green: 238/255, blue: 189/255, alpha: 1.0)
    static let customRedUnCompletedColor = UIColor(red: 226/255, green: 94/255, blue: 62/255, alpha: 1.0)
}

struct MTUserDefaults {
    static var shared = MTUserDefaults()
    
    var theme: Theme {
        get {
            Theme(rawValue: UserDefaults.standard.integer(forKey: "selectedTheme")) ?? .light
        }
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: "selectedTheme")
        }
    }
}
