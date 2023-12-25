//
//  RegistrationViewController.swift
//  Odnako
//
//  Created by User on 18.12.2023.
//

import Foundation
import UIKit
import SwiftUI

final class RegistrationViewController: UIViewController {

    // MARK: - Properties

    weak var delegate: RegistrationDelegate?

    private let usernameField = CustomTextField(fieldType: .username)
    private let emailField = CustomTextField(fieldType: .email)
    private let passwordField = CustomTextField(fieldType: .password)
    private let regisrtationImage = UIImageView(image: UIImage(named: "anonim_image"))
    private let signUpButton = CustomAuthButton(title: "Зарегистрироваться", fontSize: .big)
    private let signInButton = CustomAuthButton(title: "Войти", fontSize: .med)

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setupActions()
    }

    // MARK: - UI Configuration

    private func configureUI() {
            view.backgroundColor = .white

            let views = [regisrtationImage, usernameField, emailField, passwordField, signUpButton, signInButton]

            views.forEach {
                $0.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview($0)
            }

            // Добавление обводки к полям ввода
            let textFields = [usernameField, emailField, passwordField]
            textFields.forEach { $0.layer.borderWidth = 1.0 }
            textFields.forEach { $0.layer.borderColor = UIColor.systemGray.cgColor }
            textFields.forEach { $0.layer.cornerRadius = 8.0 }
            textFields.forEach { $0.backgroundColor = .white }

            // Конфигурация кнопок
            signUpButton.layer.cornerRadius = 8.0
            signInButton.layer.cornerRadius = 8.0
            signUpButton.tintColor = .white
            signInButton.tintColor = .white
        
        // Установка цвета текста для текстовых полей
        usernameField.textColor = .black
        emailField.textColor = .black
        passwordField.textColor = .black

        // Установка цвета текста для кнопок
        signUpButton.setTitleColor(.black, for: .normal)
        signInButton.setTitleColor(.black, for: .normal)

        
        NSLayoutConstraint.activate([
            regisrtationImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            regisrtationImage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            regisrtationImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
            regisrtationImage.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),

            usernameField.topAnchor.constraint(equalTo: regisrtationImage.bottomAnchor, constant: 20.0),
            usernameField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            usernameField.heightAnchor.constraint(equalToConstant: 50.0),
            usernameField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),

            emailField.topAnchor.constraint(equalTo: usernameField.bottomAnchor, constant: 20.0),
            emailField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailField.heightAnchor.constraint(equalToConstant: 50.0),
            emailField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),

            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 20.0),
            passwordField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordField.heightAnchor.constraint(equalToConstant: 50.0),
            passwordField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),

            signUpButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 20.0),
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpButton.heightAnchor.constraint(equalToConstant: 50.0),
            signUpButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),

            signInButton.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 20.0),
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.heightAnchor.constraint(equalToConstant: 50.0),
            signInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
        ])
    }

    // MARK: - Actions Configuration

    private func setupActions() {
        signUpButton.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)
        signInButton.addTarget(self, action: #selector(didTapSignInButton), for: .touchUpInside)
    }

    // MARK: - Actions

    @objc func didTapSignUpButton(sender: UIButton) {
        print("tapped didTapSignUpButton")

        // Создание объекта запроса для регистрации пользователя
        let registerUserRequest = RegisterUserRequest(
            username: usernameField.text ?? "",
            email: emailField.text ?? "",
            password: passwordField.text ?? ""
        )

        // Проверка валидности введенных данных
        if !AuthenticationValidator.isValidUsername(for: registerUserRequest.username) {
            presentErrorAlert(message: "Ввод имени пользователя некорректен")
            return
        }

        if !AuthenticationValidator.isValidEmail(for: registerUserRequest.email) {
            presentErrorAlert(message: "Ввод электронной почты некорректен")
            return
        }

        if !AuthenticationValidator.isValidPassword(for: registerUserRequest.password) {
            presentErrorAlert(message: "Слабый пароль. Используйте цифры, строчные, прописные буквы, спец. символы")
            return
        }

        // Вызов метода регистрации пользователя
        AuthService.shared.registerUser(with: registerUserRequest) { [weak self] wasRegistered, error in
            guard let self = self else { return }

            if let error = error {
                self.presentErrorAlert(message: error.localizedDescription)
                return
            }

            if wasRegistered {
                // Переход к главному экрану после успешной регистрации
                self.handleSuccessfulRegistration()
            }
        }
    }

    @objc func didTapSignInButton(sender: UIButton) {
        // Возврат к экрану входа при нажатии кнопки "Войти"
        self.navigationController?.popToRootViewController(animated: true)
    }

    // MARK: - Helper Methods

    private func handleSuccessfulRegistration() {
        guard let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate else {
            presentErrorAlert(message: "Ошибка регистрации")
            return
        }
        sceneDelegate.checkAuthorization()
    }

    private func presentErrorAlert(message: String) {
        let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Закрыть", style: .default, handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
}

// MARK: - Protocol Declaration

protocol RegistrationDelegate: AnyObject {
    func saveButtonTapped(username: String, password: String)
}

