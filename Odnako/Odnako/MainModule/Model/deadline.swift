//
//  deadline.swift
//  Odnako
//
//  Created by User on 23.12.2023.
//

import Foundation
import FirebaseFirestore

struct Deadline: Codable {
    let title: String
    let hasDate: Bool
    let date: Date
    let complexity: Int
    let commentary: String
    let userId: String // Добавляем поле userId
    var isCompleted: Bool

    static let noDate: String = "не\n указано"
    
    // Инициализатор
    init(title: String, hasDate: Bool, date: Date, complexity: Int, commentary: String, userId: String, isCompleted: Bool) {
        self.title = title
        self.hasDate = hasDate
        self.date = date
        self.complexity = complexity
        self.commentary = commentary
        self.userId = userId
        self.isCompleted = isCompleted
    }
    
    func isCorrectDate() -> Bool {
        if self.hasDate {
            return TimeDelta.DaysBetween(Date(), and: self.date) >= 0
        }
        return true
    }
    
    func isTitleFilled() -> Bool {
        return self.title != ""
    }
    
    static func getDates(deadlines: [Deadline]) -> [Date] {
        var dates: [Date] = []
        for deadline in deadlines {
            if deadline.hasDate {
                dates.append(deadline.date)
            }
        }
        return dates
    }
}

