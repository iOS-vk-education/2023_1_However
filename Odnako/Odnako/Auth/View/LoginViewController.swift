import Foundation
import UIKit

// Класс контроллера входа в систему
final class LoginViewController: UIViewController {
    
    // Слабая ссылка на делегата контроллера
    weak var delegate: LoginDelegate?
    
    // Элементы интерфейса пользователя
    private let emailField = CustomTextField(fieldType: .email)
    private let passwordField = CustomTextField(fieldType: .password)
    private let signUpButton = CustomAuthButton(title: "Зарегистрироваться", fontSize: .med)
    private let signInButton = CustomAuthButton(title: "Войти", fontSize: .big)
    
    // Метод для настройки интерфейса
    private func configureUI() {
        // Установка цвета фона для контроллера
        self.view.backgroundColor = .customBackGroundColor
        
        // Добавление элементов интерфейса на экран
        self.view.addSubview(emailField)
        self.view.addSubview(passwordField)
        self.view.addSubview(signUpButton)
        self.view.addSubview(signInButton)
        
        // Установка свойств для элементов интерфейса
        self.emailField.translatesAutoresizingMaskIntoConstraints = false
        self.passwordField.translatesAutoresizingMaskIntoConstraints = false
        self.signUpButton.translatesAutoresizingMaskIntoConstraints = false
        self.signInButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Установка ограничений для элементов интерфейса
        NSLayoutConstraint.activate([
            self.emailField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20.0),
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
    
    // Метод вызывается после загрузки представления
    override func viewDidLoad() {
        super.viewDidLoad()
        // Настройка интерфейса
        configureUI()
        
        // Установка обработчиков нажатия для кнопок
        self.signUpButton.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)
        self.signInButton.addTarget(self, action: #selector(didTapSignInButton), for: .touchUpInside)
    }
    
    // Обработчик нажатия кнопки "Зарегистрироваться"
    @objc
    func didTapSignUpButton(sender: UIButton) {
        // Создание экземпляра контроллера регистрации
        let vc = RegistrationViewController()
        // Переход к контроллеру регистрации
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // Обработчик нажатия кнопки "Войти"
    @objc func didTapSignInButton(sender: UIButton) {
        // Создание объекта запроса на вход пользователя
        let loginUserRequest = loginUserRequest(
            email: emailField.text ?? "",
            password: passwordField.text ?? ""
        )
        
        // Проверка валидности введенной электронной почты
        if !AuthenticationValidator.isValidEmail(for: loginUserRequest.email) {
            // Вывод сообщения об ошибке в случае невалидной электронной почты
            let alert = UIAlertController(title: "Ошибка", message: "Ввод электронной почты некорректен", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Закрыть", style: .default, handler: nil)
            alert.addAction(alertAction)
            present(alert, animated: true, completion: nil)
            return
        }
        
        // Проверка валидности введенного пароля
        if !AuthenticationValidator.isValidPassword(for: loginUserRequest.password) {
            // Вывод сообщения об ошибке в случае невалидного пароля
            let alert = UIAlertController(title: "Слабый пароль", message: "Используйте цифры, строчные, прописные буквы, спец. символы", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Закрыть", style: .default, handler: nil)
            alert.addAction(alertAction)
            present(alert, animated: true, completion: nil)
            return
        }
        
        // Вызов метода для входа пользователя через сервис аутентификации
        AuthService.shared.signIn(with: loginUserRequest) { [weak self] error in
            guard let self = self else { return }
            
            // Обработка результата входа пользователя
            if let error = error {
                // Вывод сообщения об ошибке в случае неудачного входа
                let alert = UIAlertController(title: "Ошибка Входа", message: error.localizedDescription, preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "Закрыть", style: .default, handler: nil)
                alert.addAction(alertAction)
                self.present(alert, animated: true, completion: nil)
                return
            }
            
            // Проверка делегата для выполнения дополнительных действий
            if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
                // Вызов метода проверки авторизации в делегате
                sceneDelegate.checkAuthorization()
            } else {
                // Вывод сообщения об ошибке в случае отсутствия делегата
                let alert = UIAlertController(title: "Ошибка Входа", message: "", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "Закрыть", style: .default, handler: nil)
                alert.addAction(alertAction)
                self.present(alert, animated: true, completion: nil)
                return
            }
        }
    }
}

// Протокол делегата для обработки действий в контроллере входа в систему
protocol LoginDelegate: AnyObject {
    // Метод, вызываемый при нажатии кнопки сохранения
    func saveButtonTapped(username: String, password: String)
}
