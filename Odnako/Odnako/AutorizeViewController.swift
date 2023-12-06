//
//  Autorize.swift
//  Odnako
//
//  Created by Lesa on 21.11.2023.
//

import UIKit

final class AutorizeViewController : UIViewController{
    
    weak var delegate: AutorizeDelegate?
    
    // MARK: - Properties
    
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    let password2TextField = UITextField()
    let saveButton = UIButton()
    var closeButton = UIButton()
    let ask_username_Field = UILabel()
    let ask_password_Field = UILabel()
    let ask2_password_Field = UILabel()
    let Error_label = UILabel()
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
        
        ask_username_Field.text = "Введите имя пользователя:"
        view.addSubview(ask_username_Field)
        
        ask_username_Field.translatesAutoresizingMaskIntoConstraints = false
        ////ask_username_Field.topAnchor.constraint(equalTo: addDeadlineImage.bottomAnchor, constant: 15).isActive = true
        ask_username_Field.font = UIFont.systemFont(ofSize: 24)
        ask_username_Field.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        usernameTextField.placeholder = "Username"
        usernameTextField.borderStyle = .line
        usernameTextField.font = UIFont.systemFont(ofSize: 24)
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(usernameTextField)
        
        NSLayoutConstraint.activate([
            ask_username_Field.topAnchor.constraint(equalTo: addDeadlineImage.bottomAnchor, constant: 40),
            ask_username_Field.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            usernameTextField.topAnchor.constraint(equalTo: ask_username_Field.bottomAnchor, constant: 10),
            usernameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            usernameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
        
        // Password text field
        
        ask_password_Field.text = "Введите пароль:"
        view.addSubview(ask_password_Field)
        
        ask_password_Field.translatesAutoresizingMaskIntoConstraints = false
        ask_password_Field.font = UIFont.systemFont(ofSize: 24)
        ask_password_Field.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 35).isActive = true
        ask_password_Field.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        //
        
        passwordTextField.placeholder = "Password"
        passwordTextField.borderStyle = .bezel
        passwordTextField.font = UIFont.systemFont(ofSize: 24)
        passwordTextField.isSecureTextEntry = true
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordTextField)
        
        NSLayoutConstraint.activate([
            ask_password_Field.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 30),
            ask_password_Field.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            passwordTextField.topAnchor.constraint(equalTo: ask_password_Field.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
        
        // Repeat password text field
        
        ask2_password_Field.text = "Повторите ввод пароля:"
        view.addSubview(ask2_password_Field)
        
        ask2_password_Field.translatesAutoresizingMaskIntoConstraints = false
        ask2_password_Field.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 35).isActive = true
        ask2_password_Field.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        ask2_password_Field.font = UIFont.systemFont(ofSize: 24)
        
        //
        
        password2TextField.placeholder = "Password"
        password2TextField.borderStyle = .bezel
        password2TextField.isSecureTextEntry = true
        password2TextField.font = UIFont.systemFont(ofSize: 24)
        password2TextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(password2TextField)
        
        NSLayoutConstraint.activate([
            ask2_password_Field.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            ask2_password_Field.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            password2TextField.topAnchor.constraint(equalTo: ask2_password_Field.bottomAnchor, constant: 10),
            password2TextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            password2TextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
        
        // Error_label
        Error_label.text = ""
        Error_label.textColor = .red
        view.addSubview(Error_label)
        
        Error_label.translatesAutoresizingMaskIntoConstraints = false
        Error_label.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        Error_label.font = UIFont.systemFont(ofSize: 18)
        
        NSLayoutConstraint.activate([
            Error_label.topAnchor.constraint(equalTo: password2TextField.bottomAnchor, constant: 30),
            Error_label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
        ])
        
        
        // Save button
        saveButton.setTitle("Save", for: .normal)
        saveButton.backgroundColor = UIColor.customDarkPurpleColor
        saveButton.layer.cornerRadius = 5
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.setTitleColor(.black, for: .highlighted)
        saveButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        view.addSubview(saveButton)
        
        
        NSLayoutConstraint.activate([
            saveButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.frame.height * 0.1),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            saveButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        //
        
        
        addDeadlineImage.translatesAutoresizingMaskIntoConstraints = false
        
        addDeadlineImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        addDeadlineImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addDeadlineImage.widthAnchor.constraint(equalToConstant: 230).isActive = true
        addDeadlineImage.heightAnchor.constraint(equalToConstant: 230).isActive = true
        
        
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
    
    @objc func saveButtonTapped() {
        // Обрабатываем нажатие кнопки сохранения
        let username = usernameTextField.text ?? ""
        // Получаем значение поля ввода имени пользователя или оставляем пустую строку, если поле пустое
        let password = passwordTextField.text ?? ""
        let password2 = password2TextField.text ?? ""
        // Получаем значение поля ввода пароля или оставляем пустую строку, если поле пустое
        // Добавлено условие для проверки, что оба поля имени пользователя и пароля не пусты
        guard !username.isEmpty && !password.isEmpty && !password2.isEmpty && (password == password2) else {
            if (username.isEmpty) {
                Error_label.text = "Ошибка! Пустое имя пользователя(" }
            else if (password.isEmpty) {
                Error_label.text = "Ошибка! Пустой пароль(" }
            else if (password2.isEmpty) {
                Error_label.text = "Ошибка! Пустой повтор пароля(" }
            else if (password != password2) {
                Error_label.text = "Пароль и его повтор не совпадают(" }
            Error_label.isHidden = false
            return }
        
        // Call the delegate method
        delegate?.saveButtonTapped(username: username, password: password)
        // Закрываем представление настроек
        dismiss(animated: true, completion: nil)
    }
    //
}

protocol AutorizeDelegate: AnyObject {
    func saveButtonTapped(username: String, password: String)
}
