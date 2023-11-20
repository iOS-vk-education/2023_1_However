//
//  SettingsViewController.swift
//  Odnako
//
//  Created by User on 20.11.2023.
//

import UIKit

class SettingsViewController: UIViewController {
    private let myText = UILabel()


    override func viewDidLoad() {
        super.viewDidLoad()
        myText.text = "ENfoiwein"
        view.addSubview(myText)
        myText.translatesAutoresizingMaskIntoConstraints = false
        myText.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        myText.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }
}

