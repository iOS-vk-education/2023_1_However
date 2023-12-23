//
//  SettingsViewController.swift
//  Odnako
//
//  Created by Lesa on 20.11.2023.
//

import UIKit
import FirebaseAuth

enum Theme: Int {
    case light
    case dark
    
    func getUserInterfaceStyle() -> UIUserInterfaceStyle {
        
        switch self {
        case .dark:
            return .dark
        case .light:
            return .light
        }
    }
}

class SettingsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    private let mainText = UILabel()
    let signInButton = UIButton()
    let change_Avatar_Button = UIButton()
    let Avatar_Image = UIImageView(image: UIImage(named: "avatar_image"))
    let title_name_Label = UILabel()
    let nameLabel = UILabel()
    let title_email_Label = UILabel()
    let email_Label = UILabel()
    let switchLabel = UILabel()
    var switchButton: UISwitch!


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "BackgroundColor")
        
        // Кнопка переавторизации
        signInButton.setTitle("Выйти", for: .normal)
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
        title_name_Label.text = "Имя пользователя:"
        title_name_Label.textColor = UIColor(named: "TextColor")
        title_name_Label.translatesAutoresizingMaskIntoConstraints = false
        // Установка шрифта для лейбла "Имя пользователя:"
        title_name_Label.font = UIFont.systemFont(ofSize: 24)
        view.addSubview(title_name_Label)
        // Установка ограничений для лейбла "Имя пользователя:"
        NSLayoutConstraint.activate([
            title_name_Label.topAnchor.constraint(equalTo: Avatar_Image.bottomAnchor, constant: 30),
            title_name_Label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
        ])
        
        // Создание лейбла c именем пользователя
        if let username = Auth.auth().currentUser?.displayName, !username.isEmpty {
            nameLabel.text = username
        } else {
            nameLabel.text = "А его нету("
        }
        nameLabel.textColor = UIColor(named: "TextColor")
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        // Установка жирного шрифта для лейбла c именем пользователя
        nameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        view.addSubview(nameLabel)
        // Установка ограничений для лейбла c именем пользователя
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: title_name_Label.bottomAnchor, constant: 25),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // Создание лейбла "Почта пользователя:"
        title_email_Label.text = "Почта пользователя:"
        title_email_Label.textColor = UIColor(named: "TextColor")
        title_email_Label.translatesAutoresizingMaskIntoConstraints = false
        // Установка шрифта для лейбла "Почта пользователя:"
        title_email_Label.font = UIFont.systemFont(ofSize: 24)
        view.addSubview(title_email_Label)
        // Установка ограничений для лейбла "Почта пользователя:"
        NSLayoutConstraint.activate([
            title_email_Label.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 30),
            title_email_Label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
        ])
        
        
        // Создание лейбла с почтой пользователя
        if let email = Auth.auth().currentUser?.email, !email.isEmpty {
            email_Label.text = email
        } else {
            email_Label.text = "А её нету("
        }
        email_Label.textColor = UIColor(named: "TextColor")
        email_Label.translatesAutoresizingMaskIntoConstraints = false
        // Установка жирного шрифта для лейбла с почтой пользователя
        email_Label.font = UIFont.boldSystemFont(ofSize: 24)
        view.addSubview(email_Label)
        // Установка ограничений для лейбла с почтой пользователя
        NSLayoutConstraint.activate([
            email_Label.topAnchor.constraint(equalTo: title_email_Label.bottomAnchor, constant: 25),
            email_Label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
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
        switchLabel.textColor = UIColor(named: "TextColor")
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
        if MTUserDefaults.shared.theme.getUserInterfaceStyle() == .dark {
            switchButton.isOn = true
        }
        // Добавление обработчика события изменения состояния переключателя
        switchButton.addTarget(self, action: #selector(switchStateChanged), for: .valueChanged)
        // Установка цвета контура переключателя
        switchButton.layer.borderWidth = 1
        if let textColor = UIColor(named: "TextColor") {
            switchButton.layer.borderColor = textColor.cgColor
        } else {
            switchButton.layer.borderColor = UIColor.black.cgColor
        }
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
            MTUserDefaults.shared.theme = .dark
        } else {
            MTUserDefaults.shared.theme = .light
        }
        view.window?.overrideUserInterfaceStyle = MTUserDefaults.shared.theme.getUserInterfaceStyle()
    }
    
    @objc
    func addButtonTouched(sender: UIButton) {
        AuthService.shared.signOut { [weak self] error in
            guard let self = self else { return }
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
                sceneDelegate.checkAuthorization()
            }
        }
    }
    
    @objc func change_Avatar_Touched() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = false

        let alertController = UIAlertController(title: "Выберите источник", message: nil, preferredStyle: .actionSheet)

        let galleryAction = UIAlertAction(title: "Выбрать из галереи", style: .default) { [weak self] _ in
            imagePicker.sourceType = .photoLibrary
            self?.present(imagePicker, animated: true, completion: nil)
        }
        alertController.addAction(galleryAction)

        let cameraAction = UIAlertAction(title: "Сделать фото", style: .default) { [weak self] _ in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                imagePicker.sourceType = .camera
                self?.present(imagePicker, animated: true, completion: nil)
            } else {
                // Камера не доступна, выведите уведомление
                let alert = UIAlertController(title: "Ошибка", message: "Камера не доступна на вашем устройстве", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(okAction)
                self?.present(alert, animated: true, completion: nil)
            }
        }
        alertController.addAction(cameraAction)

        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
    }
}

extension SettingsViewController {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                // Сохраняем выбранное изображение в UserDefaults
                UserDefaults.standard.set(pickedImage.pngData(), forKey: "userAvatar")
                // Обновляем аватар пользователя выбранным изображением
                Avatar_Image.image = pickedImage
            }
            picker.dismiss(animated: true, completion: nil)
        }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
