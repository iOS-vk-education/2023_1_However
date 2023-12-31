//
//  updateDeadLineViewController.swift
//  Odnako
//
//  Created by Cyril Kardash on 26.12.2023.
//

import UIKit
import FirebaseAuth


final class updateDeadLineViewController : UIViewController{
    
    // MARK: - Private let
    
    weak var editDeadlineDelegate: EditDeadlineDelegate?
    var deadline = Deadline(title: "", hasDate: false, date: Date(), complexity: 1, commentary: "", userId: "", isComplete: false)
    
    // Image
    let addDeadlineImage = UIImageView(image: UIImage(named: "addDeadlineImage"))
    
    // Labels
    let deadlineNameLabel = UILabel()
    let deadlineDateLabel = UILabel()
    let deadlineRemindLabel = UILabel()
    let deadlineDifficultyLabel = UILabel()
    let deadlineCommentaryLabel = UILabel()
    
    // TextFields
    let deadlineNameTextField = UITextField()
    let deadlineCommentaryTextView = UITextView()
    
    // Buttons
    var closeButton = UIButton()
    var saveButton = UIButton()
    let datePicker = UIDatePicker()
    let deadlineDateToggleSwitch = UISwitch()
    let deadlineComplexitySegmentedControl = UISegmentedControl(items: ["😴", "😉", "😳", "🔥", "☠️"])
    
    // MARK: - Configure
    
    private func configureSegmentedControll(){
        deadlineComplexitySegmentedControl.selectedSegmentIndex = 0
        deadlineComplexitySegmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        deadlineComplexitySegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        let font = UIFont.systemFont(ofSize: 28.0) // Установка размера шрифта
        let attributes = [NSAttributedString.Key.font: font]
        deadlineComplexitySegmentedControl.setTitleTextAttributes(attributes, for: .normal)
    }
    
    private func configureDatePicker(){
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        datePicker.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureToggleSwitch(){
        deadlineDateToggleSwitch.addTarget(self, action: #selector(switchToggled(_:)), for: .valueChanged)
        deadlineDateToggleSwitch.onTintColor = UIColor.customTabBarColor
        deadlineDateToggleSwitch.setOn(true, animated: true)
        deadlineDateToggleSwitch.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureCloseButton(){
        closeButton.setTitle("x", for: .normal)
        closeButton.setTitleColor( .black, for: .normal)
        closeButton.setTitleColor( .white, for: .highlighted)
        closeButton.backgroundColor = UIColor.customAccentColor
        closeButton.layer.cornerRadius = closeButton.frame.height / 2
        closeButton.addTarget(self, action: #selector(didTapCloseButton), for: .touchUpInside)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureSaveButton(){
        saveButton.setTitle("Изменить", for: .normal)
        saveButton.setTitleColor( .black, for: .normal)
        saveButton.setTitleColor( .white, for: .highlighted)
        saveButton.backgroundColor = UIColor.customAccentColor
        saveButton.layer.cornerRadius = 10
        saveButton.addTarget(self, action: #selector(didTapSaveButton), for: .touchUpInside)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureImages() {
        addDeadlineImage.image = UIImage(named: "addDeadlineImage")
        addDeadlineImage.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureLabels(){
        deadlineNameLabel.text = "Название дела"
        deadlineDateLabel.text = "Указать дату и время"
        // deadlineRemindLabel.text = "Напоминание"
        deadlineDifficultyLabel.text = "Сложность"
        deadlineCommentaryLabel.text = "Комментарий"
        
        deadlineDateLabel.translatesAutoresizingMaskIntoConstraints = false
        deadlineNameLabel.translatesAutoresizingMaskIntoConstraints = false
        deadlineDifficultyLabel.translatesAutoresizingMaskIntoConstraints = false
        deadlineCommentaryLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureTextFields(){
        deadlineNameTextField.backgroundColor = .customDeadlineMainColor
        deadlineNameTextField.layer.cornerRadius = 10
        deadlineNameTextField.textAlignment = .left
        deadlineNameTextField.textColor = .black
        deadlineNameTextField.font = UIFont.systemFont(ofSize: 16.0)
        deadlineNameTextField.translatesAutoresizingMaskIntoConstraints = false
            
        deadlineCommentaryTextView.backgroundColor = .customDeadlineMainColor
        deadlineCommentaryTextView.layer.cornerRadius = 10
        deadlineCommentaryTextView.textContainer.maximumNumberOfLines = 0
        deadlineCommentaryTextView.textAlignment = .left
        deadlineCommentaryTextView.font = UIFont.systemFont(ofSize: 16.0)
        deadlineCommentaryTextView.textColor = .black
        deadlineCommentaryTextView.translatesAutoresizingMaskIntoConstraints = false
    }

    private func configureUI() {
        
        view.backgroundColor = .customBackGroundColor
        
        configureImages()
        configureSegmentedControll()
        configureDatePicker()
        configureToggleSwitch()
        configureCloseButton()
        configureLabels()
        configureTextFields()
        configureSaveButton()
        
        // addSubViews
        view.addSubview(addDeadlineImage)
        view.addSubview(closeButton)
        view.addSubview(deadlineNameLabel)
        view.addSubview(deadlineNameTextField)
        view.addSubview(deadlineDateLabel)
        view.addSubview(deadlineCommentaryLabel)
        view.addSubview(deadlineDateLabel)
        view.addSubview(deadlineDifficultyLabel)
        view.addSubview(deadlineCommentaryTextView)
        view.addSubview(datePicker)
        view.addSubview(deadlineComplexitySegmentedControl)
        view.addSubview(deadlineDateToggleSwitch)
        view.addSubview(saveButton)
        
        // Установка цвета фона для всего представления
        view.backgroundColor = UIColor(named: "BackgroundColor")
        
        // Constraints
        NSLayoutConstraint.activate([
            addDeadlineImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20.0),
            addDeadlineImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // closeButton
        NSLayoutConstraint.activate([
            closeButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20.0),
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20.0),
            closeButton.widthAnchor.constraint(equalToConstant: 50.0),
            closeButton.heightAnchor.constraint(equalToConstant: 50.0)
        ])
        
        // deadlineNameLabel
        NSLayoutConstraint.activate([
            deadlineNameLabel.topAnchor.constraint(equalTo: addDeadlineImage.bottomAnchor, constant: 40.0),
            deadlineNameLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])

        // deadlineNameTextField
        NSLayoutConstraint.activate([
            deadlineNameTextField.topAnchor.constraint(equalTo: deadlineNameLabel.bottomAnchor, constant: 10.0),
            deadlineNameTextField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            deadlineNameTextField.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 9/10),
            deadlineNameTextField.heightAnchor.constraint(equalToConstant: 35.0)
        ])
        
        // deadlineDateLabel
        NSLayoutConstraint.activate([
            deadlineDateLabel.topAnchor.constraint(equalTo: deadlineNameTextField.bottomAnchor, constant: 20.0),
            deadlineDateLabel.leftAnchor.constraint(equalTo: deadlineNameTextField.leftAnchor)
        ])

        // toggleSwitch
        NSLayoutConstraint.activate([
            deadlineDateToggleSwitch.leftAnchor.constraint(equalTo: deadlineDateLabel.rightAnchor, constant: 10.0),
            deadlineDateToggleSwitch.centerYAnchor.constraint(equalTo: deadlineDateLabel.centerYAnchor)
        ])
        
        // datePicker
        NSLayoutConstraint.activate([
            datePicker.leftAnchor.constraint(equalTo: deadlineNameTextField.leftAnchor),
            datePicker.topAnchor.constraint(equalTo: deadlineDateToggleSwitch.bottomAnchor, constant: 10.0)
        ])
        
        // deadlineDifficultyLabel
        NSLayoutConstraint.activate([
            deadlineDifficultyLabel.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 20.0),
            deadlineDifficultyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // segmentedControl
        NSLayoutConstraint.activate([
            deadlineComplexitySegmentedControl.topAnchor.constraint(equalTo: deadlineDifficultyLabel.bottomAnchor, constant: 10.0),
            deadlineComplexitySegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // deadlineCommentaryLabel
        NSLayoutConstraint.activate([
            deadlineCommentaryLabel.topAnchor.constraint(equalTo: deadlineComplexitySegmentedControl.bottomAnchor, constant: 20.0),
            deadlineCommentaryLabel.leftAnchor.constraint(equalTo: deadlineNameTextField.leftAnchor)
        ])
        
        // deadlineCommentaryTextView
        NSLayoutConstraint.activate([
            deadlineCommentaryTextView.topAnchor.constraint(equalTo: deadlineCommentaryLabel.bottomAnchor, constant: 10.0),
            deadlineCommentaryTextView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            deadlineCommentaryTextView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 9/10),
            deadlineCommentaryTextView.heightAnchor.constraint(equalToConstant: 100.0)
        ])
        
        // saveButton
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: deadlineCommentaryTextView.bottomAnchor, constant: 20.0),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.widthAnchor.constraint(equalToConstant: 120.0),
            saveButton.heightAnchor.constraint(equalToConstant: 50.0)
        ])

            
    }
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
        deadlineNameTextField.text = deadline.title
        deadlineComplexitySegmentedControl.selectedSegmentIndex = deadline.complexity
        deadlineCommentaryTextView.text = deadline.commentary
        if deadlineDateToggleSwitch.isOn {
            datePicker.date = deadline.date
        }
    }
    
    // MARK: - Functions
    
    @objc
    func didTapCloseButton(sender: UIButton){
        dismiss(animated: true)
    }
    
    @objc func dateChanged(_ datePicker: UIDatePicker) {
        let selectedDate = datePicker.date
        print(selectedDate)
    }
    
    @objc func switchToggled(_ sender: UISwitch) {
        datePicker.isHidden = !sender.isOn
    }
    
    @objc
    func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        let selectedSegmentIndex = sender.selectedSegmentIndex
        let selectedVariant = sender.titleForSegment(at: selectedSegmentIndex)
        print(selectedVariant)
    }

    @objc
    func didTapSaveButton(sender: UIButton){
        
        print(self.deadlineDateToggleSwitch.isOn)
        
        let date: Date
        let hasDate: Bool
        
        if deadlineDateToggleSwitch.isOn {
            hasDate = true
            date = datePicker.date
        } else {
            hasDate = false
            date = Date()
        }
        
        let title: String = deadlineNameTextField.text ?? ""
        let complexity: Int = deadlineComplexitySegmentedControl.selectedSegmentIndex
        let commentary: String = deadlineCommentaryTextView.text ?? ""
        let userID: String = Auth.auth().currentUser?.uid ?? ""
        
        let dl = Deadline(title: title,
                          hasDate: hasDate,
                          date: date,
                          complexity: complexity,
                          commentary: commentary,
                          userId: userID,
                          isComplete: false)
        
        if !dl.isCorrectDate() {
            let alert = UIAlertController(title: "Ошибка", message: "Дата некорректна. Дата задается, начиная с текущего дня и далее", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Закрыть", style: .default, handler: nil)
            alert.addAction(alertAction)
            present(alert, animated: true, completion: nil)
            return
        }
        
        if !dl.isTitleFilled() {
            let alert = UIAlertController(title: "Ошибка", message: "Заголовок обязателен для заполнения", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Закрыть", style: .default, handler: nil)
            alert.addAction(alertAction)
            present(alert, animated: true, completion: nil)
            return
        }
        
        dismiss(animated: true)
        
        APIManager.shared.updateDeadlineInFirestore(collection: "deadlines", deadline: dl, title: deadline.title)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.editDeadlineDelegate?.didEditDeadline()
        }
    }
}

