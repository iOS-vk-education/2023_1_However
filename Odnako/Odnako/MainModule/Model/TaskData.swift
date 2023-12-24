//
//  TaskData.swift
//  Odnako
//
//  Created by Cyril Kardash on 14.12.2023.
//

import Foundation

 struct TaskData {
     let task: String
     let emoji: String
     let amountDay: String?

     init() {
         task = "Check all emails please"
         emoji = Emoji.fire.rawValue
         amountDay = String(17) + " \nдней"
     }
 }

 enum Emoji: String {
     case skeleton = "☠️"
     case fire = "🔥"
     case suprised = "😳"
     case ok = "😉"
     case sleep = "😴"
     var description: String {
         self.rawValue
     }
 }
