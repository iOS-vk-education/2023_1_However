//
//  RegistrationViewController.swift
//  Odnako
//
//  Created by User on 18.12.2023.
//

import Foundation
import UIKit

final class RegistrationViewController : UIViewController{
    
    weak var delegate: RegistrationDelegate?
    
    private let usernameField = CustomTextField(fieldType: .username)
    private let emailField = CustomTextField(fieldType: .email)
    private let passwordField = CustomTextField(fieldType: .password)
    
    private let regisrtationImage = UIImageView(image: UIImage(named: "anonim_image"))

    private let signUpButton = CustomAuthButton(title: "Зарегистрироваться", fontSize: .big)
    private let signInButton = CustomAuthButton(title: "Войти", fontSize: .med)
    
    
    private func configureUI(){
        self.view.backgroundColor = .customBackGroundColor
        
        self.view.addSubview(usernameField)
        self.view.addSubview(emailField)
        self.view.addSubview(passwordField)
        self.view.addSubview(signUpButton)
        self.view.addSubview(signInButton)
        self.view.addSubview(regisrtationImage)
        
        self.usernameField.translatesAutoresizingMaskIntoConstraints = false
        self.emailField.translatesAutoresizingMaskIntoConstraints = false
        self.passwordField.translatesAutoresizingMaskIntoConstraints = false
        self.signUpButton.translatesAutoresizingMaskIntoConstraints = false
        self.signInButton.translatesAutoresizingMaskIntoConstraints = false
        self.regisrtationImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.regisrtationImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            self.regisrtationImage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            self.regisrtationImage.widthAnchor.constraint(equalToConstant: 60.0),
            self.regisrtationImage.heightAnchor.constraint(equalToConstant: 60.0),
            
            self.usernameField.topAnchor.constraint(equalTo: self.regisrtationImage.bottomAnchor, constant: 20.0),
            self.usernameField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            self.usernameField.heightAnchor.constraint(equalToConstant: 50.0),
            self.usernameField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            self.emailField.topAnchor.constraint(equalTo: self.usernameField.bottomAnchor, constant: 20.0),
            self.emailField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            self.emailField.heightAnchor.constraint(equalToConstant: 50.0),
            self.emailField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            self.passwordField.topAnchor.constraint(equalTo: self.emailField.bottomAnchor, constant: 20.0),
            self.passwordField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            self.passwordField.heightAnchor.constraint(equalToConstant: 50.0),
            self.passwordField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            self.signUpButton.topAnchor.constraint(equalTo: self.passwordField.bottomAnchor, constant: 20.0),
            self.signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            self.signUpButton.heightAnchor.constraint(equalToConstant: 50.0),
            self.signUpButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            self.signInButton.topAnchor.constraint(equalTo: self.signUpButton.bottomAnchor, constant: 20.0),
            self.signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            self.signInButton.heightAnchor.constraint(equalToConstant: 50.0),
            self.signInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
        ])

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
        self.signUpButton.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)
        self.signInButton.addTarget(self, action: #selector(didTapSignInButton), for: .touchUpInside)
        
    }
    
    @objc
    func didTapSignUpButton(sender: UIButton){
        print("tapped didTapSignUpButton")
    }
    
    @objc func didTapSignInButton(sender: UIButton){
        self.navigationController?.popToRootViewController(animated: true)
    }
    //
}

protocol RegistrationDelegate: AnyObject {
    func saveButtonTapped(username: String, password: String)
}

