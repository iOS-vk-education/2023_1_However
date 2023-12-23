//
//  CalendarViewController.swift
//  Odnako
//
//  Created by User on 20.11.2023.
//

// Import библиотеки
import UIKit
import FSCalendar

class CalendarViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource {
    private let myText = UILabel()
    private let calendar = FSCalendar()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Настройка календаря
        calendar.delegate = self
        calendar.dataSource = self
        view.addSubview(calendar)
        
        // Настройка текста
        myText.text = "Calendar"
        view.addSubview(myText)
        myText.translatesAutoresizingMaskIntoConstraints = false
        myText.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        myText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        
        // Настройка календаря
        calendar.translatesAutoresizingMaskIntoConstraints = false
        calendar.topAnchor.constraint(equalTo: myText.bottomAnchor, constant: 20).isActive = true
        calendar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        calendar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        calendar.heightAnchor.constraint(equalToConstant: 300).isActive = true
    }
    // Метод делегата, вызываемый при выборе даты
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        // Создание экземпляра addDeadLineViewController с выбранной датой
        let addDeadlineVC = addDeadLineViewController()
        
        // Настройка вашего addDeadLineViewController с выбранной датой
        // Например, передача даты в качестве параметра
        //addDeadlineVC.selectedDate = date
        
        // Отображение addDeadLineViewController
        present(addDeadlineVC, animated: true, completion: nil)
    }

}

