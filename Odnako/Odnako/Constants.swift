//
//  Constants.swift
//  Odnako
//
//  Created by Cyril Kardash on 14.12.2023.
//


import UIKit

struct Constants {
    static let buttonSizeForMain = CGSize(width: 50.0, height: 50.0)
}

struct ImagesNames {
    static let mainFilterImage = "mainFilterImage"
    static let addImage = "plus"
}

struct Identifier {
    static let cellIdentifier = "MainCell"
    static let MainVC = "MainViewController"
}

enum filterButtonOptions : String {
    case alphabet = "По алфавиту"
    case date = "По дате"
    case complexity = "По сложности"
    case isCompleted = "По статусу выполения"
    
    static let allOptions = [alphabet, date, complexity, isCompleted]
}
