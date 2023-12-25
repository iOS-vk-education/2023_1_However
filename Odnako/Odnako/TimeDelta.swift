//
//  TimeDelta.swift
//  Odnako
//
//  Created by User on 24.12.2023.
//

import Foundation

class TimeDelta {
    
    static func DaysBetween(_ start: Date, and end: Date) -> Int {
        let calendar = Calendar.current
        let startOfStart = calendar.startOfDay(for: start)
        let startOfEnd = calendar.startOfDay(for: end)

        let components = calendar.dateComponents([.day], from: startOfStart, to: startOfEnd)
        return components.day ?? 0
    }
    
}
