import Foundation
import UIKit

final class LoginViewController: UIViewController {

    weak var delegate: LoginDelegate?

    private let emailField = CustomTextField(fieldType: .email)
    private let passwordField = CustomTextField(fieldType: .password)
    private let loginImage = UIImageView(image: UIImage(named: "LoginImage"))
    private let signUpButton = CustomAuthButton(title: "Зарегистрироваться", fontSize: .med)
    private let signInButton = CustomAuthButton(title: "Войти", fontSize: .big)

    private func configureUI() {
        self.view.backgroundColor = .white

        emailField.textColor = .black
        passwordField.textColor = .black

        signUpButton.setTitleColor(.black, for: .normal)
        signInButton.setTitleColor(.black, for: .normal)

        loginImage.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.4) // Уменьшаем высоту изображения
        loginImage.contentMode = .scaleToFill
        self.loginImage.translatesAutoresizingMaskIntoConstraints = false

        self.view.addSubview(loginImage)
        self.view.addSubview(emailField)
        self.view.addSubview(passwordField)
        self.view.addSubview(signUpButton)
        self.view.addSubview(signInButton)

        self.emailField.translatesAutoresizingMaskIntoConstraints = false
        self.passwordField.translatesAutoresizingMaskIntoConstraints = false
        self.signUpButton.translatesAutoresizingMaskIntoConstraints = false
        self.signInButton.translatesAutoresizingMaskIntoConstraints = false

        let textFieldBorderColor = UIColor.systemGray4.cgColor
        let textFieldBorderWidth: CGFloat = 1.0

        emailField.layer.borderColor = textFieldBorderColor
        emailField.layer.borderWidth = textFieldBorderWidth
        emailField.layer.cornerRadius = 8.0

        passwordField.layer.borderColor = textFieldBorderColor
        passwordField.layer.borderWidth = textFieldBorderWidth
        passwordField.layer.cornerRadius = 8.0

        NSLayoutConstraint.activate([
            self.loginImage.topAnchor.constraint(equalTo: view.topAnchor),
            self.loginImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            self.loginImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            self.loginImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4), // Устанавливаем высоту изображения в 40% высоты экрана

            self.emailField.topAnchor.constraint(equalTo: self.loginImage.bottomAnchor, constant: 20.0),
            self.emailField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.emailField.heightAnchor.constraint(equalToConstant: 50.0),
            self.emailField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),

            self.passwordField.topAnchor.constraint(equalTo: self.emailField.bottomAnchor, constant: 20.0),
            self.passwordField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.passwordField.heightAnchor.constraint(equalToConstant: 50.0),
            self.passwordField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),

            self.signInButton.topAnchor.constraint(equalTo: self.passwordField.bottomAnchor, constant: 20.0),
            self.signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.signInButton.heightAnchor.constraint(equalToConstant: 50.0),
            self.signInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),

            self.signUpButton.topAnchor.constraint(equalTo: self.signInButton.bottomAnchor, constant: 20.0),
            self.signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.signUpButton.heightAnchor.constraint(equalToConstant: 50.0),
            self.signUpButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        self.signUpButton.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)
        self.signInButton.addTarget(self, action: #selector(didTapSignInButton), for: .touchUpInside)
    }

    @objc func didTapSignUpButton(sender: UIButton) {
        let vc = RegistrationViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @objc func didTapSignInButton(sender: UIButton) {
        let loginUserRequest = loginUserRequest(
            email: emailField.text ?? "",
            password: passwordField.text ?? ""
        )

        if !AuthenticationValidator.isValidEmail(for: loginUserRequest.email) {
            let alert = UIAlertController(title: "Ошибка", message: "Ввод электронной почты некорректен", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Закрыть", style: .default, handler: nil)
            alert.addAction(alertAction)
            present(alert, animated: true, completion: nil)
            return
        }

        if !AuthenticationValidator.isValidPassword(for: loginUserRequest.password) {
            let alert = UIAlertController(title: "Слабый пароль", message: "Используйте цифры, строчные, прописные буквы, спец. символы", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Закрыть", style: .default, handler: nil)
            alert.addAction(alertAction)
            present(alert, animated: true, completion: nil)
            return
        }

        AuthService.shared.signIn(with: loginUserRequest) { [weak self] error in
            guard let self = self else { return }

            if let error = error {
                let alert = UIAlertController(title: "Ошибка Входа", message: error.localizedDescription, preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "Закрыть", style: .default, handler: nil)
                alert.addAction(alertAction)
                self.present(alert, animated: true, completion: nil)
                return
            }

            if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
                sceneDelegate.checkAuthorization()
            } else {
                let alert = UIAlertController(title: "Ошибка Входа", message: "", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "Закрыть", style: .default, handler: nil)
                alert.addAction(alertAction)
                self.present(alert, animated: true, completion: nil)
                return
            }
        }
    }
}

protocol LoginDelegate: AnyObject {
    func saveButtonTapped(username: String, password: String)
}
