//
//  ViewController.swift
//  Odnako
//
//  Created by User on 13.11.2023.
//

import UIKit

extension UIColor{
    static let customBackGroundColor = UIColor(red: 126/255, green: 170/255, blue: 146/255, alpha: 1.0)
    static let customLightGreenColor = UIColor(red: 190/255, green: 228/255, blue: 192/255, alpha: 1.0)
    static let customDarkGreenColor = UIColor(red: 107/255, green: 175/255, blue: 105/255, alpha: 1.0)
    static let customTabBarColor = UIColor(red: 147/255, green: 201/255, blue: 149/255, alpha: 1.0)
    static let customAccentColor = UIColor(red: 255/255, green: 217/255, blue: 183/255, alpha: 1.0)
}

class ViewController: UIViewController {
    
    private let label = UILabel()
    private let deadlineMainView = UIView()
    private let deadlineLeftView = UIView()
    private let deadlineRightView = UIView()
    private let dayAmount = UILabel()
    private let emoji = UILabel()
    private let days = UILabel()
    private let deadlineTextView = UIView()
    private let mainText = UILabel()
    


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.customBackGroundColor
        deadlineMainView.backgroundColor = UIColor.customLightGreenColor
        deadlineRightView.backgroundColor = UIColor.customDarkGreenColor
        deadlineLeftView.backgroundColor = UIColor.customDarkGreenColor

        
        
        label.text = "Hello world"
        label.textAlignment = .center
        emoji.text = "💀"
        emoji.textAlignment = .center
        emoji.font.withSize(30)
        dayAmount.text = "14"
        dayAmount.textColor = .white
        days.text = "Дней"
        days.textColor = .white
        
        mainText.text = "Check all emails on your web-site before deadline rvrkrwbvlbewlvbwlbvlwhrblvhbrvhbwververberb"
        mainText.textAlignment = .center
        
        
        
        view.addSubview(label)
        view.addSubview(deadlineMainView)
        
        deadlineMainView.addSubview(deadlineRightView)
        deadlineMainView.addSubview(deadlineLeftView)
        deadlineRightView.addSubview(emoji)
        deadlineLeftView.addSubview(dayAmount)
        deadlineLeftView.addSubview(days)
        deadlineMainView.addSubview(mainText)
//        deadlineTextView.addSubview(deadlineMainView)
        
        deadlineMainView.translatesAutoresizingMaskIntoConstraints = false
        deadlineLeftView.translatesAutoresizingMaskIntoConstraints = false
        deadlineRightView.translatesAutoresizingMaskIntoConstraints = false
        emoji.translatesAutoresizingMaskIntoConstraints = false
        dayAmount.translatesAutoresizingMaskIntoConstraints = false
        days.translatesAutoresizingMaskIntoConstraints = false
        mainText.translatesAutoresizingMaskIntoConstraints = false



        
        // Main
        
        deadlineMainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        deadlineMainView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        deadlineMainView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        deadlineMainView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 10/11).isActive = true
        deadlineMainView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 1/10).isActive = true
        deadlineMainView.layer.cornerRadius = 12
        
        
        
        // Left
        
        deadlineLeftView.leftAnchor.constraint(equalTo: deadlineMainView.leftAnchor).isActive = true
        deadlineLeftView.widthAnchor.constraint(equalTo: deadlineMainView.widthAnchor, multiplier: 1/5).isActive = true
        deadlineLeftView.heightAnchor.constraint(equalTo: deadlineMainView.heightAnchor).isActive = true
        deadlineLeftView.layer.cornerRadius = 12
        deadlineLeftView.centerYAnchor.constraint(equalTo: deadlineMainView.centerYAnchor).isActive = true
        
        dayAmount.topAnchor.constraint(equalTo: deadlineLeftView.topAnchor).isActive = true
        dayAmount.centerXAnchor.constraint(equalTo: deadlineLeftView.centerXAnchor).isActive = true
        dayAmount.heightAnchor.constraint(equalTo: deadlineLeftView.heightAnchor).isActive = true
        
        days.bottomAnchor.constraint(equalTo: deadlineLeftView.bottomAnchor).isActive = true
        days.centerXAnchor.constraint(equalTo: deadlineLeftView.centerXAnchor).isActive = true
        
        
        // Right
        
        deadlineRightView.rightAnchor.constraint(equalTo: deadlineMainView.rightAnchor).isActive = true
        deadlineRightView.widthAnchor.constraint(equalTo: deadlineMainView.widthAnchor, multiplier: 1/5).isActive = true
        deadlineRightView.heightAnchor.constraint(equalTo: deadlineMainView.heightAnchor).isActive = true
        deadlineRightView.layer.cornerRadius = 12
        deadlineRightView.centerYAnchor.constraint(equalTo: deadlineMainView.centerYAnchor).isActive = true
        

        emoji.topAnchor.constraint(equalTo: deadlineRightView.topAnchor).isActive = true
        emoji.bottomAnchor.constraint(equalTo: deadlineRightView.bottomAnchor).isActive = true
        emoji.rightAnchor.constraint(equalTo: deadlineRightView.rightAnchor).isActive = true
        emoji.leftAnchor.constraint(equalTo: deadlineRightView.leftAnchor).isActive = true
        
        // mainTextView
        mainText.topAnchor.constraint(equalTo: deadlineMainView.topAnchor).isActive = true
        mainText.bottomAnchor.constraint(equalTo: deadlineMainView.bottomAnchor).isActive = true
        mainText.leftAnchor.constraint(equalTo: deadlineLeftView.rightAnchor, constant: 10).isActive = true
        mainText.rightAnchor.constraint(equalTo: deadlineRightView.leftAnchor, constant: -10).isActive = true
        //mainText.adjustsFontSizeToFitWidth = true
        mainText.numberOfLines = 2

        
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.topAnchor.constraint(equalTo:
                                    view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        
        label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: -10).isActive = true
        
        label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        
        
        
        

    }


}

