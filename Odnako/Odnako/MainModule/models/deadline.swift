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
    let date: Date
    let complexity: Int
    let commentary: String
    let userId: String // Добавляем поле userId
    
    // Инициализатор
    init(title: String, date: Date, complexity: Int, commentary: String, userId: String) {
        self.title = title
        self.date = date
        self.complexity = complexity
        self.commentary = commentary
        self.userId = userId
    }
}

