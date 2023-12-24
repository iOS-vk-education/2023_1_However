//
//  SortingDeadlines.swift
//  Odnako
//
//  Created by User on 24.12.2023.
//

import Foundation

class SortingDeadline {
    
    static func sortByComplexity(deadlines: [Deadline]) -> [Deadline]{
        var sortedDeadlines = deadlines
        
        sortedDeadlines.sort {
            $0.complexity > $1.complexity
        }
        return sortedDeadlines
    }
    
    static func sortByTitle(deadlines: [Deadline]) -> [Deadline] {
        var sortedDeadlines = deadlines
        
        sortedDeadlines.sort {
            $0.title < $1.title
        }
        return sortedDeadlines
    }
    
    static func sortByDate(deadlines: [Deadline]) -> [Deadline] {

        let sortedDeadlines = deadlines.sorted { (firstDeadline, secondDeadline) -> Bool in
            if firstDeadline.hasDate && !secondDeadline.hasDate {
                return true
            } else if !firstDeadline.hasDate && secondDeadline.hasDate {
                return false
            } else if !firstDeadline.hasDate && !secondDeadline.hasDate{
                return false
            } else {
                return firstDeadline.date < secondDeadline.date
            }
        }
        return sortedDeadlines
    }
    
}
