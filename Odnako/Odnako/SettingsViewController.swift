//
//  SettingsViewController.swift
//  Odnako
//
//  Created by Lesa on 20.11.2023.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage
import SDWebImage

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
        // Fetch and load user avatar from Firebase Storage
        loadUserAvatar()
        
        
        // Картинка - аватарка
        view.addSubview(Avatar_Image)
        Avatar_Image.translatesAutoresizingMaskIntoConstraints = false
        Avatar_Image.contentMode = .scaleAspectFill
        Avatar_Image.layer.masksToBounds = true
        Avatar_Image.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        Avatar_Image.heightAnchor.constraint(equalToConstant: 250).isActive = true
        Avatar_Image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        Avatar_Image.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        
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
        change_Avatar_Button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(change_Avatar_Button)
        // Установка ограничений для кнопки
        NSLayoutConstraint.activate([
            // Ограничение по вертикали (30 пунктов вниз от email_Label)
            change_Avatar_Button.topAnchor.constraint(equalTo: email_Label.bottomAnchor, constant: 30),
            // Ограничение по горизонтали (20% ширины экрана от левого края)
            change_Avatar_Button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.bounds.width * 0.2),
            // Ограничение по ширине (60% ширины экрана)
            change_Avatar_Button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
            // Ограничение по высоте (50 пунктов)
            change_Avatar_Button.heightAnchor.constraint(equalToConstant: 50)
        ])
        
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
        switchButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(switchButton)
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
        // Установка ограничений для переключателя
        NSLayoutConstraint.activate([
            switchButton.centerYAnchor.constraint(equalTo: switchLabel.centerYAnchor),
            switchButton.leadingAnchor.constraint(equalTo: switchLabel.trailingAnchor, constant: 30)
        ])

        // Кнопка переавторизации
        signInButton.setTitle("Выйти", for: .normal)
        signInButton.setTitleColor(.white, for: .normal)
        signInButton.setTitleColor(.black, for: .highlighted)
        signInButton.backgroundColor = UIColor.customDarkPurpleColor
        signInButton.layer.cornerRadius = 5
        signInButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        signInButton.addTarget(self, action: #selector(addButtonTouched), for: .touchUpInside)
         signInButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(signInButton)
        // Установка ограничений для кнопки
        NSLayoutConstraint.activate([
            // Ограничение по вертикали (30 пунктов вниз от switchLabel)
            signInButton.topAnchor.constraint(equalTo: switchLabel.bottomAnchor, constant: 30),
            // Ограничение по горизонтали (10% ширины экрана от левого края)
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.bounds.width * 0.1),
            // Ограничение по ширине (80% ширины экрана)
            signInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            // Ограничение по высоте (50 пунктов)
            signInButton.heightAnchor.constraint(equalToConstant: 50)
        ])
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
    
    // Метод вызывается при нажатии кнопки "Изменить аватарку"
    @objc func change_Avatar_Touched() {
        // Создание экземпляра UIImagePickerController для выбора или создания фото
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = false

        // Создание контроллера для выбора источника фото (галерея или камера)
        let alertController = UIAlertController(title: "Выберите источник", message: nil, preferredStyle: .actionSheet)

        // Добавление действия для выбора из галереи
        let galleryAction = UIAlertAction(title: "Выбрать из галереи", style: .default) { [weak self] _ in
            imagePicker.sourceType = .photoLibrary
            self?.present(imagePicker, animated: true, completion: nil)
        }
        alertController.addAction(galleryAction)

        // Добавление действия для выбора из камеры
        let cameraAction = UIAlertAction(title: "Сделать фото", style: .default) { [weak self] _ in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                imagePicker.sourceType = .camera
                self?.present(imagePicker, animated: true, completion: nil)
            } else {
                // Вывод предупреждения, если камера не доступна
                let alert = UIAlertController(title: "Ошибка", message: "Камера не доступна на вашем устройстве", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(okAction)
                self?.present(alert, animated: true, completion: nil)
            }
        }
        alertController.addAction(cameraAction)

        // Добавление действия для отмены
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)

        // Отображение контроллера выбора источника
        present(alertController, animated: true, completion: nil)
    }
    // Function to load user avatar from Firebase Storage
    func loadUserAvatar() {
        guard let userEmail = Auth.auth().currentUser?.email else {
            // Handle the case where the user's email is not available
            return
        }
        let db = Firestore.firestore()
        let avatarRef = db.collection("your_collection").document(userEmail)
        avatarRef.getDocument { [weak self] (document, error) in
            guard let self = self, let document = document, document.exists else {
                // Handle the case where the document doesn't exist or there is an error
                return
            }
            if let avatarURLString = document.data()?["avatarURL"] as? String, let avatarURL = URL(string: avatarURLString) {
                // Load the user's avatar image from the Firebase Storage URL
                self.Avatar_Image.sd_setImage(with: avatarURL, placeholderImage: UIImage(named: "avatar_image"))
            }
        }
    }
}

// Расширение для обработки выбора и загрузки изображения
extension SettingsViewController {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            // Сохранение данных изображения в UserDefaults
            UserDefaults.standard.set(pickedImage.pngData(), forKey: "userAvatar")
            
            // Обновление аватара пользователя выбранным изображением
            Avatar_Image.image = pickedImage

            // Сохранение данных изображения в Firestore
            saveImageToFirestore(pickedImage)
        }
        // Закрытие контроллера выбора изображения
        picker.dismiss(animated: true, completion: nil)
    }

    // Обработка отмены выбора изображения
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Закрытие контроллера выбора изображения
        picker.dismiss(animated: true, completion: nil)
    }

    // Сохранение изображения в Firebase Storage и URL в Firestore
    func saveImageToFirestore(_ image: UIImage) {
        guard let userEmail = Auth.auth().currentUser?.email else {
            // Обработка случая, когда электронная почта пользователя недоступна
            print("Ошибка - электронная почта не доступна.")
            return
        }
        
        // Correcting the image orientation
        guard let correctedImage = image.correctOrientation() else {
            print("Error correcting image orientation.")
            return
        }
        // Resize the image
        guard let resizedImage = correctedImage.resize(to: CGSize(width: 250, height: 250)) else {
                print("Error resizing image.")
            return
        }
        // Ссылка на место хранения изображения в Firebase Storage
        let storageRef = Storage.storage().reference().child("avatars").child("\(userEmail).png")

        if let imageData = resizedImage.pngData() {
            // Загрузка данных изображения в хранилище Firebase
            storageRef.putData(imageData, metadata: nil) { (metadata, error) in
                if let error = error {
                    // Обработка ошибки при загрузке изображения в хранилище
                    print("Error uploading image to storage: \(error.localizedDescription)")
                    return
                }

                // Изображение успешно загружено, теперь сохранение URL в Firestore
                storageRef.downloadURL { (url, error) in
                    if let error = error {
                        // Обработка ошибки при получении URL изображения
                        print("Error getting download URL: \(error.localizedDescription)")
                        return
                    }

                    guard let downloadURL = url else {
                        // Обработка случая, когда URL изображения равен nil
                        print("Download URL is nil")
                        return
                    }

                    // Сохранение URL изображения в Firestore
                    let db = Firestore.firestore()
                    db.collection("your_collection").document(userEmail).setData(["avatarURL": downloadURL.absoluteString], merge: true) { error in
                        if let error = error {
                            // Обработка ошибки при сохранении URL в Firestore
                            print("Error saving avatar URL to Firestore: \(error.localizedDescription)")
                            return
                        }

                        // Успешное сохранение URL изображения в Firestore
                        print("Avatar URL saved successfully.")
                    }
                }
            }
        }
    }
}

// Extension to correct image orientation
extension UIImage {
    func correctOrientation() -> UIImage? {
        if imageOrientation == .up {
            return self
        }

        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(in: CGRect(origin: .zero, size: size))
        let normalizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return normalizedImage
    }
}

extension UIImage {
    func resize(to size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: size))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
