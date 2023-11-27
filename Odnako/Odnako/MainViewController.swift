//
//  MainViewController.swift
//  Odnako
//
//  Created by User on 20.11.2023.
//

import UIKit

extension UIColor{
    static let customBackGroundColor = UIColor(red: 126/255, green: 170/255, blue: 146/255, alpha: 1.0)
    static let customLightGreenColor = UIColor(red: 190/255, green: 228/255, blue: 192/255, alpha: 1.0)
    static let customDarkGreenColor = UIColor(red: 107/255, green: 175/255, blue: 105/255, alpha: 1.0)
    static let customTabBarColor = UIColor(red: 147/255, green: 201/255, blue: 149/255, alpha: 1.0)
    static let customAccentColor = UIColor(red: 255/255, green: 217/255, blue: 183/255, alpha: 1.0)
    static let customDarkPurpleColor = UIColor.purple // темно-фиолетовый
    static let customLightPurpleColor = UIColor(red: 190/255, green: 179/255, blue: 228/255, alpha: 1.0) // фиолетовый
    static let customBackGroundColor_new = UIColor.white
}

class MainViewController: UIViewController {
    
    private let deadlineMainView = UIView()
    private let deadlineLeftView = UIView()
    private let deadlineRightView = UIView()
    private let dayAmount = UILabel()
    private let emoji = UILabel()
    private let days = UILabel()
    private let deadlineTextView = UIView()
    private let mainText = UILabel()
    private var addDeadlineButton = UIButton()
    


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.customBackGroundColor
        deadlineMainView.backgroundColor = UIColor.customLightGreenColor
        deadlineRightView.backgroundColor = UIColor.customDarkGreenColor
        deadlineLeftView.backgroundColor = UIColor.customDarkGreenColor


        emoji.text = "💀"
        emoji.textAlignment = .center
        emoji.font.withSize(30)
        dayAmount.text = "14"
        dayAmount.textColor = .white
        days.text = "Дней"
        days.textColor = .white
        
        mainText.text = "Check all emails on your web-site before deadline rvrkrwbvlbewlvbwlbvlwhrblvhbrvhbwververberb"
        mainText.textAlignment = .center
        addDeadlineButton.setTitle("+", for: .normal)
        addDeadlineButton.setTitleColor( .black, for: .normal)
        addDeadlineButton.setTitleColor( .white, for: .highlighted)
        addDeadlineButton.backgroundColor = UIColor.customAccentColor
        addDeadlineButton.layer.cornerRadius = 10
        addDeadlineButton.addTarget(self, action: #selector(addButtonTouched), for: .touchUpInside)
        
        
        
        
        
        
        view.addSubview(addDeadlineButton)
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
        addDeadlineButton.translatesAutoresizingMaskIntoConstraints = false


        // safeArea
        addDeadlineButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20.0).isActive = true
        addDeadlineButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20.0).isActive = true
        addDeadlineButton.widthAnchor.constraint(equalToConstant: 50.0).isActive = true
        addDeadlineButton.heightAnchor.constraint(equalToConstant: 50.0).isActive = true

        
        // Main
        
        deadlineMainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        deadlineMainView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true

        deadlineMainView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 10/11).isActive = true

        deadlineMainView.layer.cornerRadius = 12
        deadlineMainView.heightAnchor.constraint(equalToConstant: 70.0).isActive = true
        
        
        
        // Left
        
        deadlineLeftView.leftAnchor.constraint(equalTo: deadlineMainView.leftAnchor).isActive = true
        deadlineLeftView.widthAnchor.constraint(equalTo: deadlineMainView.widthAnchor, multiplier: 1/5).isActive = true
        deadlineLeftView.heightAnchor.constraint(equalTo: deadlineMainView.heightAnchor).isActive = true
        deadlineLeftView.layer.cornerRadius = 12
        deadlineLeftView.centerYAnchor.constraint(equalTo: deadlineMainView.centerYAnchor).isActive = true
        
        dayAmount.centerXAnchor.constraint(equalTo: deadlineLeftView.centerXAnchor).isActive = true
        dayAmount.centerYAnchor.constraint(equalTo: deadlineLeftView.centerYAnchor, constant: -10).isActive = true

        
        days.topAnchor.constraint(equalTo: dayAmount.bottomAnchor).isActive = true
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

    }
    
    @objc
    func addButtonTouched (sender: UIButton){
        present(addDeadLineViewController(), animated: true)
    }


}

