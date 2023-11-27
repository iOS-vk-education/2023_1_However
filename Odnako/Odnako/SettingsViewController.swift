//
//  SettingsViewController.swift
//  Odnako
//
//  Created by User on 20.11.2023.
//

import UIKit

class SettingsViewController: UIViewController {
    private let mainText = UILabel()
    let signInButton = UIButton()
    let Avatar_Image = UIImageView(image: UIImage(named: "avatar_image"))


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.customBackGroundColor_new
        

        
        //
        
        signInButton.setTitle("sign in", for: .normal)
        signInButton.setTitleColor(.black, for: .normal)
        signInButton.setTitleColor(.white, for: .highlighted)
        signInButton.backgroundColor = UIColor.customLightPurpleColor
       
        signInButton.layer.cornerRadius = 10
        signInButton.addTarget(self, action: #selector(addButtonTouched), for: .touchUpInside)
        // Установка фрейма кнопки
        signInButton.frame = CGRect(x: view.bounds.width * 0.1, y: view.bounds.height * 0.5, width: view.bounds.width * 0.8, height: 50)
        view.addSubview(signInButton)
        
        view.addSubview(Avatar_Image)
        Avatar_Image.translatesAutoresizingMaskIntoConstraints = false

        // Добавление и установка констрейнтов
        Avatar_Image.contentMode = .scaleAspectFill
        Avatar_Image.layer.masksToBounds = true
        Avatar_Image.widthAnchor.constraint(equalToConstant: 150).isActive = true
        Avatar_Image.heightAnchor.constraint(equalToConstant: 150).isActive = true
        Avatar_Image.layer.cornerRadius = Avatar_Image.frame.size.width / 1.3
        Avatar_Image.layer.cornerRadius = Avatar_Image.frame.size.height / 1.3
        Avatar_Image.clipsToBounds = true
        Avatar_Image.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        Avatar_Image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
    }
    
    @objc
    func addButtonTouched (sender: UIButton){
        present(AutorizeViewController(), animated: true)
    }
    }
