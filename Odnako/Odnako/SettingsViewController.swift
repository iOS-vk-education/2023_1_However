//
//  SettingsViewController.swift
//  Odnako
//
//  Created by Lesa on 20.11.2023.
//

import UIKit

class SettingsViewController: UIViewController, AutorizeDelegate {
    private let mainText = UILabel()
    let signInButton = UIButton()
    let change_Avatar_Button = UIButton()
    let Avatar_Image = UIImageView(image: UIImage(named: "avatar_image"))
    let nameLabel = UILabel()
    let usernameTextField = UITextField()
    let passwordLabel = UILabel()
    let passwordTextField = UITextField()
    let switchLabel = UILabel()
    var switchButton: UISwitch!


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.customBackGroundColor_new
        
        // Кнопка переавторизации
        signInButton.setTitle("sign in", for: .normal)
        signInButton.setTitleColor(.white, for: .normal)
        signInButton.setTitleColor(.black, for: .highlighted)
        signInButton.backgroundColor = UIColor.customDarkPurpleColor
        signInButton.layer.cornerRadius = 5
        signInButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        signInButton.addTarget(self, action: #selector(addButtonTouched), for: .touchUpInside)
        // Установка фрейма кнопки
        signInButton.frame = CGRect(x: view.bounds.width * 0.1, y: view.bounds.height * 0.8, width: view.bounds.width * 0.8, height: 50)
        view.addSubview(signInButton)
        
        
        // Картинка - аватарка
        view.addSubview(Avatar_Image)
        Avatar_Image.translatesAutoresizingMaskIntoConstraints = false
        Avatar_Image.contentMode = .scaleAspectFill
        Avatar_Image.layer.masksToBounds = true
        Avatar_Image.widthAnchor.constraint(equalToConstant: 230).isActive = true
        Avatar_Image.heightAnchor.constraint(equalToConstant: 230).isActive = true
        Avatar_Image.layer.cornerRadius = Avatar_Image.frame.size.width / 1.2
        Avatar_Image.layer.cornerRadius = Avatar_Image.frame.size.height / 1.2
        Avatar_Image.clipsToBounds = true
        Avatar_Image.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        Avatar_Image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        
        // Создание лейбла "Имя пользователя:"
        nameLabel.text = "Имя пользователя:"
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        // Установка шрифта для лейбла "Имя пользователя:"
        nameLabel.font = UIFont.systemFont(ofSize: 24)
        view.addSubview(nameLabel)

        // Создание поля ввода
        usernameTextField.placeholder = "Username"
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        // Устанавливаем размер шрифта для поля ввода
        usernameTextField.font = UIFont.systemFont(ofSize: 24)
        // Установка цвета обводки для поля ввода
        usernameTextField.layer.borderWidth = 1
        usernameTextField.borderStyle = .bezel
        usernameTextField.layer.borderColor = UIColor.darkGray.cgColor
        view.addSubview(usernameTextField)
        

        // Установка ограничений для лейбла "Имя пользователя:" и поля ввода
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: Avatar_Image.bottomAnchor, constant: 30),
            nameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),

            usernameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            usernameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            usernameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
        
        // Создание лейбла "Имя пользователя:"
        passwordLabel.text = "Пароль:"
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        // Установка шрифта для лейбла "Имя пользователя:"
        passwordLabel.font = UIFont.systemFont(ofSize: 24)
        view.addSubview(passwordLabel)

        // Создание поля ввода
        passwordTextField.placeholder = "Password"
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        // Устанавливаем размер шрифта для поля ввода
        passwordTextField.font = UIFont.systemFont(ofSize: 24)
        // Установка цвета обводки для поля ввода
        passwordTextField.isSecureTextEntry = true
        passwordTextField.layer.borderWidth = 1
        passwordTextField.borderStyle = .bezel
        passwordTextField.layer.borderColor = UIColor.darkGray.cgColor
        view.addSubview(passwordTextField)
        

        // Установка ограничений для лейбла "Пароль:" и поля ввода
        NSLayoutConstraint.activate([
            passwordLabel.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 30),
            passwordLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),

            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
        
        
        // Кнопка изменения аватарки
        change_Avatar_Button.setTitle("изменить аватарку", for: .normal)
        change_Avatar_Button.setTitleColor(.black, for: .normal)
        change_Avatar_Button.setTitleColor(.white, for: .highlighted)
        change_Avatar_Button.backgroundColor = UIColor.customLightPurpleColor
        change_Avatar_Button.layer.cornerRadius = 20
        change_Avatar_Button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        change_Avatar_Button.addTarget(self, action: #selector(change_Avatar_Touched), for: .touchUpInside)
        // Установка фрейма кнопки
        change_Avatar_Button.frame = CGRect(x: view.bounds.width * 0.2, y: view.bounds.height * 0.65, width: view.bounds.width * 0.6, height: 50)
        view.addSubview(change_Avatar_Button)
        
        //cv.backgroundColor = UIColor.customBackGroundColor
        
        // Создание лейбла "Тёмная тема:"
        switchLabel.text = "Тёмная тема:"
        switchLabel.translatesAutoresizingMaskIntoConstraints = false
        // Установка шрифта для лейбла "Имя пользователя:"
        switchLabel.font = UIFont.systemFont(ofSize: 24)
        view.addSubview(switchLabel)
        // Установка ограничений для лейбла
        NSLayoutConstraint.activate([
            switchLabel.topAnchor.constraint(equalTo: change_Avatar_Button.bottomAnchor, constant: 20),
            switchLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
        ])
        
        
        // Создание экземпляра переключателя
        switchButton = UISwitch()
        // Настройка положения и размера переключателя
        switchButton.frame = CGRect(x: view.bounds.width * 0.55, y: view.bounds.height * 0.735, width: 0, height: 0)
        // Установка начального значения переключателя
        switchButton.isOn = false
        // Добавление обработчика события изменения состояния переключателя
        switchButton.addTarget(self, action: #selector(switchStateChanged), for: .valueChanged)
        // Установка цвета контура переключателя
        switchButton.layer.borderWidth = 1
        switchButton.layer.borderColor = UIColor.black.cgColor
        switchButton.layer.cornerRadius = switchButton.frame.height/2
        switchButton.layer.borderColor = UIColor.black.cgColor
        // Установка цвета шарика переключателя
        switchButton.thumbTintColor = UIColor.customDarkPurpleColor
        switchButton.onTintColor = UIColor.customLightPurpleColor
        // Добавление переключателя на экран
        view.addSubview(switchButton)
    }
            
    // Обработчик события изменения состояния переключателя
    @objc func switchStateChanged() {
        if switchButton.isOn {
            print("Переключатель включен")
        } else {
            print("Переключатель выключен")
        }
    }
    
    @objc
    func addButtonTouched(sender: UIButton) {
        let autorizeViewController = AutorizeViewController()
        autorizeViewController.delegate = self
        present(autorizeViewController, animated: true)
    }
    
    @objc func change_Avatar_Touched() {
        let alert = UIAlertController(title: "Уведомление", message: "Вы типо поменяли аватарку", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "ОК", style: .default, handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
    
    func saveButtonTapped(username: String, password: String) {
            // Use the username and password values here in the SettingsViewController
            // For example:
            usernameTextField.text = username
            passwordTextField.text = password
        }
    
    
}
