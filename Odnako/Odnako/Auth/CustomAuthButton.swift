//
//  CustomAuthButton.swift
//  Odnako
//
//  Created by User on 18.12.2023.
//

import Foundation
import UIKit

class CustomAuthButton: UIButton {
    
    enum FontSize {
        case big
        case med
    }
    
    init(title: String, fontSize: FontSize) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = 12
        self.layer.masksToBounds = true
        
        self.backgroundColor = .customBackGroundColor
        
        let titleColor: UIColor = .black
        self.setTitleColor(titleColor, for: .normal)
        
        switch fontSize {
        case .big:
            self.titleLabel?.font = .systemFont(ofSize: 22, weight: .bold)
            
        case .med:
            self.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
