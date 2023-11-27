//
//  Autorize.swift
//  Odnako
//
//  Created by user on 21.11.2023.
//

import UIKit

final class AutorizeViewController : UIViewController{
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    let saveButton = UIButton()
    var closeButton = UIButton()
    let ask_username_Field = UILabel()
    let ask_password_Field = UILabel()
    let addDeadlineImage = UIImageView(image: UIImage(named: "anonim_image"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.customBackGroundColor_new
    
        
        view.addSubview(closeButton)
        view.addSubview(addDeadlineImage)
        
        
        closeButton.setTitle("x", for: .normal)
        closeButton.setTitleColor( .black, for: .normal)
        closeButton.setTitleColor( .white, for: .highlighted)
        closeButton.backgroundColor = UIColor.customLightPurpleColor
        closeButton.layer.cornerRadius = 10
        closeButton.addTarget(self, action: #selector(didTapCloseButton), for: .touchUpInside)
    
        
        //
        // Username text field
        
        ask_username_Field.text = "Введите ваше имя пользователя:"
        view.addSubview(ask_username_Field)

        ask_username_Field.translatesAutoresizingMaskIntoConstraints = false
        ask_username_Field.topAnchor.constraint(equalTo: addDeadlineImage.bottomAnchor, constant: 15).isActive = true
        ask_username_Field.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        //
        usernameTextField.placeholder = "Username"
        usernameTextField.borderStyle = .line
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(usernameTextField)
        
        NSLayoutConstraint.activate([
            usernameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            usernameTextField.centerYAnchor.constraint(equalTo: ask_username_Field.bottomAnchor, constant: 35),
            usernameTextField.widthAnchor.constraint(equalToConstant: 200),
            usernameTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        // Password text field
        
        ask_password_Field.text = "Введите ваш пароль:"
        view.addSubview(ask_password_Field)

        ask_password_Field.translatesAutoresizingMaskIntoConstraints = false
        ask_password_Field.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 35).isActive = true
        ask_password_Field.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        //
        
        passwordTextField.placeholder = "Password"
        passwordTextField.borderStyle = .bezel
        passwordTextField.isSecureTextEntry = true
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordTextField)
        
        NSLayoutConstraint.activate([
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: ask_password_Field.bottomAnchor, constant: 15),
            passwordTextField.widthAnchor.constraint(equalToConstant: 200),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        // Save button
        saveButton.setTitle("Save", for: .normal)
        saveButton.backgroundColor = UIColor.customDarkPurpleColor
        saveButton.layer.cornerRadius = 5
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        view.addSubview(saveButton)
        
        NSLayoutConstraint.activate([
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 35),
            saveButton.widthAnchor.constraint(equalToConstant: 100),
            saveButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        //
        
        
        
      
        addDeadlineImage.translatesAutoresizingMaskIntoConstraints = false
        
        addDeadlineImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        addDeadlineImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        

        // safeArea
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20.0).isActive = true
        closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20.0).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 50.0).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        
        
    }
    
    @objc
    func didTapCloseButton(sender: UIButton){
        dismiss(animated: true)
    }
    //
    @objc func saveButtonTapped() {
        // Handle saving username and password here
        let username = usernameTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        if (password == ""){
            passwordTextField.placeholder = "Error!"}
        
        // Perform necessary actions with the saved data
        
        // Dismiss the settings view controller
        dismiss(animated: true, completion: nil)
    }
    //
}
