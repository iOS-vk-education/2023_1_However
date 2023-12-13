//
//  Data.swift
//  Odnako
//
//  Created by Cyril Kardash on 13.12.2023.
//

import Foundation

struct TaskData {
    let task: String
    let emoji: String
    let amountDay: String?
    
    init() {
        task = "Check all emails please"
        emoji = Emoji.skeleton.rawValue
        amountDay = String(17) + " \nдней"
    }
}

enum Emoji: String {
    case skeleton = "💀"
    case fun = "😀"
    var description: String {
        self.rawValue
    }
}
