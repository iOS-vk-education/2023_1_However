//
//  CalendarViewController.swift
//  Odnako
//
//  Created by User on 20.11.2023.
//

// Import библиотеки
import UIKit
import FSCalendar


protocol CalendarViewControllerDelegate {
    func updateDeadlineDates(dates: [Date])
}

class CalendarViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource {
    private let myText = UILabel()
    private let calendar = FSCalendar()
    weak var mainVC: MainViewController?
    var deadlinesDates: [Date] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Настройка календаря
        calendar.delegate = self
        calendar.dataSource = self
        view.addSubview(calendar)

        // Настройка текста
        myText.text = "Календарь"
        myText.font = UIFont.boldSystemFont(ofSize: 24)
        view.addSubview(myText)
        myText.translatesAutoresizingMaskIntoConstraints = false
        myText.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        myText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true

        // В методе viewDidLoad вашего CalendarViewController
        calendar.appearance.titleDefaultColor = UIColor(named: "TextColor")
        calendar.appearance.titleSelectionColor = UIColor.customLightPurpleColor

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
        print(date)
        addDeadlineVC.datePicker.setDate(date, animated: false)

        addDeadlineVC.addDeadlineDelegate = mainVC

        // Настройка вашего addDeadLineViewController с выбранной датой
        // Например, передача даты в качестве параметра
        //addDeadlineVC.selectedDate = date

        // Отображение addDeadLineViewController
        present(addDeadlineVC, animated: true, completion: nil)
    }

//    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillDefaultColorFor date: Date) -> UIColor? {
//        if self.deadlinesDates.contains(date) { // проверяем, содержит ли массив выбранную дату
//            return UIColor.customAccentColor // возвращаем красный цвет для даты из массива
//        }
//        return nil // возвращаем nil, чтобы другие ячейки были нарисованы стандартным цветом
//    }
}

extension CalendarViewController: CalendarViewControllerDelegate {
    func updateDeadlineDates(dates: [Date]) {
        self.deadlinesDates = dates
        calendar.reloadData()
    }
}

extension CalendarViewController: FSCalendarDelegateAppearance {
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillDefaultColorFor date: Date) -> UIColor? {
        let calendar = Calendar.current
        let componentsOfDate = calendar.dateComponents([.year, .month, .day], from: date)

        for deadlineDate in deadlinesDates {
            let componentsOfDeadlineDate = calendar.dateComponents([.year, .month, .day], from: deadlineDate)

            if componentsOfDate == componentsOfDeadlineDate {
                return UIColor.customLightPurpleColor
            }
        }

        return nil
    }
}
