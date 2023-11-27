//
//  addDeadLineViewController.swift
//  Odnako
//
//  Created by User on 20.11.2023.
//

import UIKit

final class addDeadLineViewController : UIViewController{
    let titleDD = UILabel()
    var closeButton = UIButton()
    let addDeadlineImage = UIImageView(image: UIImage(named: "addDeadlineImage"))
    
    let deadlineNameLabel = UILabel()
    let deadlineDateLabel = UILabel()
    let deadlineTimeLabel = UILabel()
    let deadlineRemindLabel = UILabel()
    let deadlineDifficultyLabel = UILabel()
    
    let deadlineNameTextField = UITextField()
    let deadlineDateTextField = UITextField()
    let deadlineTimeTextField = UITextField()
    let deadlineRemindTextField = UITextField()
    let deadlineDifficultyTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.customBackGroundColor
        
        deadlineNameLabel.text = "Название дела"
        deadlineDateLabel.text = "Дата"
        deadlineTimeLabel.text = "Время"
        deadlineRemindLabel.text = "Напоминание"
        deadlineDifficultyLabel.text = "Сложность"
        
        deadlineNameTextField.backgroundColor = UIColor.customDeadlineMainColor
        deadlineNameTextField.layer.cornerRadius = 10

        
        view.addSubview(closeButton)
        view.addSubview(addDeadlineImage)
        
        view.addSubview(deadlineNameLabel)
//        view.addSubview(deadlineDateLabel)
//        view.addSubview(deadlineTimeLabel)
//        view.addSubview(deadlineRemindLabel)
//        view.addSubview(deadlineDifficultyLabel)
        
        view.addSubview(deadlineNameTextField)
//        view.addSubview(deadlineDateTextField)
//        view.addSubview(deadlineTimeTextField)
//        view.addSubview(deadlineRemindTextField)
//        view.addSubview(deadlineDifficultyTextField)
        
        closeButton.setTitle("x", for: .normal)
        closeButton.setTitleColor( .black, for: .normal)
        closeButton.setTitleColor( .white, for: .highlighted)
        closeButton.backgroundColor = UIColor.customAccentColor
        closeButton.layer.cornerRadius = 10
        closeButton.addTarget(self, action: #selector(didTapCloseButton), for: .touchUpInside)
    
        
        
        
        
        
      
        addDeadlineImage.translatesAutoresizingMaskIntoConstraints = false
        
        addDeadlineImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        addDeadlineImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        // Labels
        deadlineNameLabel.translatesAutoresizingMaskIntoConstraints = false
        deadlineNameLabel.topAnchor.constraint(equalTo: addDeadlineImage.bottomAnchor, constant: 40.0).isActive = true
        deadlineNameLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        deadlineNameTextField.translatesAutoresizingMaskIntoConstraints = false
        deadlineNameTextField.topAnchor.constraint(equalTo: deadlineNameLabel.bottomAnchor, constant: 10.0).isActive = true
        deadlineNameTextField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        deadlineNameTextField.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 9/10).isActive = true
        deadlineNameTextField.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        
        

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
}
