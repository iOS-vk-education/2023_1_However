//
//  RegistrationViewController.swift
//  Odnako
//
//  Created by User on 18.12.2023.
//

import Foundation
import UIKit
import SwiftUI

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
        let registerUserRequest = RegisterUserRequest(
            username: self.usernameField.text ?? "",
            email: self.emailField.text ?? "",
            password: self.passwordField.text ?? ""
        )
        
        if !Validator.isValidUsername(for: registerUserRequest.username){
            let alert = UIAlertController(title: "Ошибка", message: "Ввод имени пользователя некорректен", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Закрыть", style: .default, handler: nil)
            alert.addAction(alertAction)
            present(alert, animated: true, completion: nil)
            return
        }
        
        if !Validator.isValidEmail(for: registerUserRequest.email){
            let alert = UIAlertController(title: "Ошибка", message: "Ввод электронной почты некорректен", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Закрыть", style: .default, handler: nil)
            alert.addAction(alertAction)
            present(alert, animated: true, completion: nil)
            return
        }
        
        if !Validator.isValidPassword(for: registerUserRequest.password){
            let alert = UIAlertController(title: "Слабый пароль", message: "Используйте цифры, строчные, прописные буквы, спец. символы", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Закрыть", style: .default, handler: nil)
            alert.addAction(alertAction)
            present(alert, animated: true, completion: nil)
            return
        }
        
        AuthService.shared.registerUser(with: registerUserRequest) { [weak self] wasRegistered, error in
            
            guard let self = self else { return }
            
            if let error = error {
                let alert = UIAlertController(title: "Ошибка регистрации", message: error.localizedDescription, preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "Закрыть", style: .default, handler: nil)
                alert.addAction(alertAction)
                self.present(alert, animated: true, completion: nil)
                return
            }
            
            if wasRegistered {
                if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
                    sceneDelegate.checkAuthorization()
                } else {
                    let alert = UIAlertController(title: "Ошибка регистрации", message: "", preferredStyle: .alert)
                    let alertAction = UIAlertAction(title: "Закрыть", style: .default, handler: nil)
                    alert.addAction(alertAction)
                    self.present(alert, animated: true, completion: nil)
                    return
                }
            }
            
            
            
        }
        
        
    }
    
    @objc func didTapSignInButton(sender: UIButton){
        self.navigationController?.popToRootViewController(animated: true)
    }
    //
}

protocol RegistrationDelegate: AnyObject {
    func saveButtonTapped(username: String, password: String)
}

