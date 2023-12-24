//
//  CalendarViewController.swift
//  Odnako
//
//  Created by User on 20.11.2023.
//
//
import UIKit
import SwiftUI

var dates: [String] = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37"]

class CalendarViewController: UIViewController {}
//{
//
//    private let year = UIButton()
//    private let month = UIButton()
//    private let calendar = UIButton()
//    private let selectMonthYaer = UILabel()
//
//
//
//    //only button only hardcore
//    private let Cell1 = UIButton()
//    private let Cell2 = UIButton()
//    private let Cell3 = UIButton()
//    private let Cell4 = UIButton()
//    private let Cell5 = UIButton()
//    private let Cell6 = UIButton()
//    private let Cell7 = UIButton()
//    private let Cell8 = UIButton()
//    private let Cell9 = UIButton()
//    private let Cell10 = UIButton()
//    private let Cell11 = UIButton()
//    private let Cell12 = UIButton()
//    private let Cell13 = UIButton()
//    private let Cell14 = UIButton()
//    private let Cell15 = UIButton()
//    private let Cell16 = UIButton()
//    private let Cell17 = UIButton()
//    private let Cell18 = UIButton()
//    private let Cell19 = UIButton()
//    private let Cell20 = UIButton()
//    private let Cell21 = UIButton()
//    private let Cell22 = UIButton()
//    private let Cell23 = UIButton()
//    private let Cell24 = UIButton()
//    private let Cell25 = UIButton()
//    private let Cell26 = UIButton()
//    private let Cell27 = UIButton()
//    private let Cell28 = UIButton()
//    private let Cell29 = UIButton()
//    private let Cell30 = UIButton()
//    private let Cell31 = UIButton()
//    private let Cell32 = UIButton()
//    private let Cell33 = UIButton()
//    private let Cell34 = UIButton()
//    private let Cell35 = UIButton()
//    private let Cell36 = UIButton()
//    private let Cell37 = UIButton()
//
//
//
//
//
//
//
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setYear()
//        setMonth()
//
//        year.titleLabel?.text = "2023"
//
//        month.titleLabel?.text = "Декабрь"
//
//        selectMonthYaer.text = "   \(year.currentTitle!) \(month.currentTitle!)"
//
//        calendar.setTitle("", for: .normal)
//        calendar.setTitleColor( .black, for: .normal)
//        calendar.setTitleColor( .white, for: .highlighted)
//
//
//        view.addSubview(year)
//        view.addSubview(month)
//        view.addSubview(calendar)
//        view.addSubview(selectMonthYaer)
//
//        view.addSubview(Cell1)
//        view.addSubview(Cell2)
//        view.addSubview(Cell3)
//        view.addSubview(Cell4)
//        view.addSubview(Cell5)
//        view.addSubview(Cell6)
//        view.addSubview(Cell7)
//        view.addSubview(Cell8)
//        view.addSubview(Cell8)
//        view.addSubview(Cell9)
//        view.addSubview(Cell10)
//        view.addSubview(Cell11)
//        view.addSubview(Cell12)
//        view.addSubview(Cell13)
//        view.addSubview(Cell14)
//        view.addSubview(Cell15)
//        view.addSubview(Cell16)
//        view.addSubview(Cell17)
//        view.addSubview(Cell18)
//        view.addSubview(Cell19)
//        view.addSubview(Cell20)
//        view.addSubview(Cell21)
//        view.addSubview(Cell22)
//        view.addSubview(Cell23)
//        view.addSubview(Cell24)
//        view.addSubview(Cell25)
//        view.addSubview(Cell26)
//        view.addSubview(Cell27)
//        view.addSubview(Cell28)
//        view.addSubview(Cell29)
//        view.addSubview(Cell30)
//        view.addSubview(Cell31)
//        view.addSubview(Cell32)
//        view.addSubview(Cell33)
//        view.addSubview(Cell34)
//        view.addSubview(Cell35)
//        view.addSubview(Cell36)
//        view.addSubview(Cell37)
//
//
//
//
//
//
//
//        update()
//
//
//
//
//    }
//<<<<<<< HEAD
//<<<<<<< Updated upstream
//}
//=======
//
//
//    func update(){
//
//        let thisYear: Int = Int(year
//            .currentTitle!)!
//        let thisMonth: Int
//
//        switch month.currentTitle!{
//            case "Январь":
//                thisMonth = 1
//            case "Февраль":
//                thisMonth = 2
//            case "Март":
//                thisMonth = 3
//            case "Апрель":
//                thisMonth = 4
//            case "Май":
//                thisMonth = 5
//            case "Июнь":
//                thisMonth = 6
//            case "Июль":
//                thisMonth = 7
//            case "Август":
//                thisMonth = 8
//            case "Сентябрь":
//                thisMonth = 9
//            case "Октябрь":
//                thisMonth = 10
//            case "Ноябрь":
//                thisMonth = 11
//            case "Декабрь":
//                thisMonth = 12
//            default :
//                thisMonth = 0
//                print("default")
//        }
//
//
//        let cells : [CellOfData] = monthYearToCells(year: thisYear, month: thisMonth)
//
//        let cellsView : [UIButton] = uniteCells()
//
//        for i in 1...37{
//            cellsView[i-1].setTitle(String(cells[i-1].chislo), for: .normal)
//            cellsView[i-1].isEnabled = cells[i-1].activeLy
//            cellsView[i-1].isHidden = !cells[i-1].activeLy
//
//
//            cellsView[i-1].setTitleColor( .black, for: .normal)
//            cellsView[i-1].setTitleColor( .white, for: .highlighted)
//            cellsView[i-1].backgroundColor = UIColor.customLightPurpleColor
//            cellsView[i-1].layer.cornerRadius = 5
//            cellsView[i-1].addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
//        }
//        selectMonthYaer.text = "\(year.currentTitle!)  \( month.currentTitle!)"
//        year.addTarget(self, action: #selector(didTapYear), for: .allEvents)
//        month.addTarget(self, action: #selector(didTapMonth), for: .allEvents)
//    }
//
//
//
//
//    @objc private func didTapYear(){
//        update()
//    }
//
//    @objc private func didTapMonth(){
//        update()
//    }
//
//    @objc private func didTapButton(){
//        update()
//    }
//
//    private func monthYearToCells (year:Int , month: Int) -> [CellOfData] {
//        let getDate = Date()
//        var dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "dd.MM.yyyy, HH:mm:ss"
//        print(dateFormatter.string(from: getDate))
//        dateFormatter.dateFormat = "dd, MMMM yyyy hh:mm" // в кавычках задается формат в котором хочешь видеть дату. В твоем случае надо dd/MM
//        print (dateFormatter.string(from: getDate))
//        dateFormatter.setLocalizedDateFormatFromTemplate("EEE MMM d yyyy")
//        print(dateFormatter.string(from: getDate))
//
//
//
//
//        let basicCell = CellOfData(activeLy: false, chislo: 0, today: false)
//        var cellsOfData : [CellOfData] = Array <CellOfData> (repeating:basicCell ,count: 37)
//
//
//        //----------------------------Col-vo cells---------------------------------
//
//        var dateComponents = DateComponents(year: year, month: month)
//        var calendar = Calendar.current
//        var date = calendar.date(from: dateComponents)!
//
//        let range = calendar.range(of: .day, in: .month, for: date)!
//        let colvoDays = range.count
//
//        //--------------------------first cell and kalendar---------------------------
//        dateComponents = DateComponents(year: year, month: month, day: 1)
//        calendar = Calendar.current
//        date = calendar.date(from: dateComponents)!
//        dateFormatter = DateFormatter()
//        dateFormatter.setLocalizedDateFormatFromTemplate("EEE")
//        let dayNedely = dateFormatter.string(from: date)
//
//        var numberOfFirstCell : Int
//
//        switch dayNedely {
//            case "Пн":
//                numberOfFirstCell = 1
//            case "Вт":
//                numberOfFirstCell = 2
//            case "Ср":
//                numberOfFirstCell = 3
//            case "Чт":
//                numberOfFirstCell = 4
//            case "Пт":
//                numberOfFirstCell = 5
//            case "Сб":
//                numberOfFirstCell = 6
//            case "Вс":
//                numberOfFirstCell = 7
//            default :
//                numberOfFirstCell = 0
//                print("default")
//        }
//
//
//
//        for i in numberOfFirstCell...(colvoDays + numberOfFirstCell-1) {
//            cellsOfData [i-1] = CellOfData(activeLy: true,  chislo: i-numberOfFirstCell+1, today: false)
//        }
//
//
//
//        return cellsOfData
//    }
//
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        year.backgroundColor = .purple
//        year.translatesAutoresizingMaskIntoConstraints = false
//        year.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
//        year.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
//        year.rightAnchor.constraint(equalTo: view.centerXAnchor, constant: -10).isActive = true
//        year.layer.borderColor = UIColor.black.cgColor
//        year.layer.borderWidth = 2
//        year.layer.cornerRadius = year.frame.height/2
//
//        month.translatesAutoresizingMaskIntoConstraints = false
//        month.backgroundColor = .purple
//        month.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
//        month.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: 10).isActive = true
//        month.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
//        month.layer.borderColor = UIColor.black.cgColor
//        month.layer.borderWidth = 2
//        month.layer.cornerRadius = year.frame.height/2
//
//
//        calendar.backgroundColor = .purple
//        calendar.layer.cornerRadius = 10
//        calendar.translatesAutoresizingMaskIntoConstraints = false
//        calendar.topAnchor.constraint(equalTo: month.bottomAnchor, constant: 20).isActive = true
//        calendar.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
//        calendar.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
//        calendar.layer.borderColor = UIColor.black.cgColor
//        calendar.layer.borderWidth = 2
//
//
//
//        selectMonthYaer.backgroundColor = .purple
//        selectMonthYaer.layer.cornerRadius = 10
//        selectMonthYaer.translatesAutoresizingMaskIntoConstraints = false
//        selectMonthYaer.topAnchor.constraint(equalTo: calendar.topAnchor, constant: 5).isActive = true
//        selectMonthYaer.leftAnchor.constraint(equalTo: calendar.leftAnchor, constant: 10).isActive = true
//        selectMonthYaer.rightAnchor.constraint(equalTo: calendar.rightAnchor, constant: -10).isActive = true
//        selectMonthYaer.textAlignment = .center
//
//
//
//        //ONLY BUTTON ONLY HARDCOOOOORE
//        let widthOfCalendar = CGFloat(view.safeAreaLayoutGuide.layoutFrame.width - 20)
//
//        let widthOfCellsCalendar = CGFloat(widthOfCalendar  * 0.1)
//        let distanceBetweenObjects = CGFloat((widthOfCalendar - CGFloat(7 * widthOfCellsCalendar)) * 0.125)
//        let width2 = widthOfCellsCalendar + distanceBetweenObjects
//        print (" \(widthOfCalendar)   \(widthOfCellsCalendar)    \(distanceBetweenObjects) \n \n \n \n \n \n \n \n \n \n \n \n")
//
//        Cell1.translatesAutoresizingMaskIntoConstraints = false
//        Cell1.layer.borderColor = UIColor.black.cgColor
//        Cell1.layer.borderWidth = 2
//        Cell1.backgroundColor = .blue
//        Cell1.layer.cornerRadius = 5
//        Cell1.titleLabel?.textColor = .black
//        Cell1.topAnchor.constraint(equalTo: selectMonthYaer.bottomAnchor, constant: 20).isActive = true
//        Cell1.leftAnchor.constraint(equalTo: calendar.leftAnchor, constant: distanceBetweenObjects ).isActive = true
//        Cell1.rightAnchor.constraint(equalTo: calendar.leftAnchor, constant: width2 ).isActive = true
//        Cell1.bottomAnchor.constraint(equalTo: selectMonthYaer.bottomAnchor, constant: 60).isActive = true
//
//        Cell2.translatesAutoresizingMaskIntoConstraints = false
//        Cell2.layer.borderColor = UIColor.black.cgColor
//        Cell2.layer.borderWidth = 2
//        Cell2.backgroundColor = .blue
//        Cell2.layer.cornerRadius = 5
//        Cell2.titleLabel?.textColor = .black
//        Cell2.topAnchor.constraint(equalTo: selectMonthYaer.bottomAnchor, constant: 20).isActive = true
//        Cell2.leftAnchor.constraint(equalTo: Cell1.rightAnchor, constant: distanceBetweenObjects ).isActive = true
//        Cell2.rightAnchor.constraint(equalTo: Cell1.rightAnchor, constant: width2 ).isActive = true
//        Cell2.bottomAnchor.constraint(equalTo: selectMonthYaer.bottomAnchor, constant: 60).isActive = true
//
//        Cell3.translatesAutoresizingMaskIntoConstraints = false
//        Cell3.layer.borderColor = UIColor.black.cgColor
//        Cell3.layer.borderWidth = 2
//        Cell3.backgroundColor = .blue
//        Cell3.layer.cornerRadius = 5
//        Cell3.titleLabel?.textColor = .black
//        Cell3.topAnchor.constraint(equalTo: selectMonthYaer.bottomAnchor,constant: 20).isActive = true
//        Cell3.leftAnchor.constraint(equalTo: Cell2.rightAnchor,constant: distanceBetweenObjects).isActive = true
//        Cell3.rightAnchor.constraint(equalTo: Cell2.rightAnchor, constant: width2).isActive = true
//        Cell3.bottomAnchor.constraint(equalTo: selectMonthYaer.bottomAnchor, constant: 60).isActive = true
//
//        Cell4.translatesAutoresizingMaskIntoConstraints = false
//        Cell4.layer.borderColor = UIColor.black.cgColor
//        Cell4.layer.borderWidth = 2
//        Cell4.backgroundColor = .blue
//        Cell4.layer.cornerRadius = 5
//        Cell4.titleLabel?.textColor = .black
//        Cell4.topAnchor.constraint(equalTo: selectMonthYaer.bottomAnchor, constant: 20).isActive = true
//        Cell4.leftAnchor.constraint(equalTo: Cell3.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell4.rightAnchor.constraint(equalTo: Cell3.rightAnchor, constant: width2).isActive = true
//        Cell4.bottomAnchor.constraint(equalTo: selectMonthYaer.bottomAnchor, constant: 60).isActive = true
//
//        Cell5.translatesAutoresizingMaskIntoConstraints = false
//        Cell5.layer.borderColor = UIColor.black.cgColor
//        Cell5.layer.borderWidth = 2
//        Cell5.backgroundColor = .blue
//        Cell5.layer.cornerRadius = 5
//        Cell5.titleLabel?.textColor = .black
//        Cell5.topAnchor.constraint(equalTo: selectMonthYaer.bottomAnchor, constant: 20).isActive = true
//        Cell5.leftAnchor.constraint(equalTo: Cell4.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell5.rightAnchor.constraint(equalTo: Cell4.rightAnchor, constant: width2).isActive = true
//        Cell5.bottomAnchor.constraint(equalTo: selectMonthYaer.bottomAnchor, constant: 60).isActive = true
//
//        Cell6.translatesAutoresizingMaskIntoConstraints = false
//        Cell6.layer.borderColor = UIColor.black.cgColor
//        Cell6.layer.borderWidth = 2
//        Cell6.backgroundColor = .blue
//        Cell6.layer.cornerRadius = 5
//        Cell6.titleLabel?.textColor = .black
//        Cell6.topAnchor.constraint(equalTo: selectMonthYaer.bottomAnchor, constant: 20).isActive = true
//        Cell6.leftAnchor.constraint(equalTo: Cell5.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell6.rightAnchor.constraint(equalTo: Cell5.rightAnchor, constant: width2).isActive = true
//        Cell6.bottomAnchor.constraint(equalTo: selectMonthYaer.bottomAnchor, constant: 60).isActive = true
//
//        Cell7.translatesAutoresizingMaskIntoConstraints = false
//        Cell7.layer.borderColor = UIColor.black.cgColor
//        Cell7.layer.borderWidth = 2
//        Cell7.backgroundColor = .blue
//        Cell7.layer.cornerRadius = 5
//        Cell7.titleLabel?.textColor = .black
//        Cell7.topAnchor.constraint(equalTo: selectMonthYaer.bottomAnchor, constant: 20).isActive = true
//        Cell7.leftAnchor.constraint(equalTo: Cell6.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell7.rightAnchor.constraint(equalTo: Cell6.rightAnchor, constant: width2).isActive = true
//        Cell7.bottomAnchor.constraint(equalTo: selectMonthYaer.bottomAnchor, constant: 60).isActive = true
//
//        Cell8.translatesAutoresizingMaskIntoConstraints = false
//        Cell8.layer.borderColor = UIColor.black.cgColor
//        Cell8.layer.borderWidth = 2
//        Cell8.backgroundColor = .blue
//        Cell8.layer.cornerRadius = 5
//        Cell8.titleLabel?.textColor = .black
//        Cell8.topAnchor.constraint(equalTo: Cell1.bottomAnchor, constant: 10).isActive = true
//        Cell8.leftAnchor.constraint(equalTo: calendar.leftAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell8.rightAnchor.constraint(equalTo: calendar.leftAnchor, constant: width2).isActive = true
//        Cell8.bottomAnchor.constraint(equalTo: Cell1.bottomAnchor, constant: 50).isActive = true
//
//        Cell9.translatesAutoresizingMaskIntoConstraints = false
//        Cell9.layer.borderColor = UIColor.black.cgColor
//        Cell9.layer.borderWidth = 2
//        Cell9.backgroundColor = .blue
//        Cell9.layer.cornerRadius = 5
//        Cell9.titleLabel?.textColor = .black
//        Cell9.topAnchor.constraint(equalTo: Cell1.bottomAnchor, constant: 10).isActive = true
//        Cell9.leftAnchor.constraint(equalTo: Cell8.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell9.rightAnchor.constraint(equalTo: Cell8.rightAnchor, constant: width2).isActive = true
//        Cell9.bottomAnchor.constraint(equalTo: Cell1.bottomAnchor, constant: 50).isActive = true
//
//        Cell10.translatesAutoresizingMaskIntoConstraints = false
//        Cell10.layer.borderColor = UIColor.black.cgColor
//        Cell10.layer.borderWidth = 2
//        Cell10.backgroundColor = .blue
//        Cell10.layer.cornerRadius = 5
//        Cell10.titleLabel?.textColor = .black
//        Cell10.topAnchor.constraint(equalTo: Cell1.bottomAnchor, constant: 10).isActive = true
//        Cell10.leftAnchor.constraint(equalTo: Cell9.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell10.rightAnchor.constraint(equalTo: Cell9.rightAnchor, constant: width2).isActive = true
//        Cell10.bottomAnchor.constraint(equalTo: Cell1.bottomAnchor, constant: 50).isActive = true
//
//        Cell11.translatesAutoresizingMaskIntoConstraints = false
//        Cell11.layer.borderColor = UIColor.black.cgColor
//        Cell11.layer.borderWidth = 2
//        Cell11.backgroundColor = .blue
//        Cell11.layer.cornerRadius = 5
//        Cell11.titleLabel?.textColor = .black
//        Cell11.topAnchor.constraint(equalTo: Cell1.bottomAnchor, constant: 10).isActive = true
//        Cell11.leftAnchor.constraint(equalTo: Cell10.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell11.rightAnchor.constraint(equalTo: Cell10.rightAnchor, constant: width2).isActive = true
//        Cell11.bottomAnchor.constraint(equalTo: Cell1.bottomAnchor, constant: 50).isActive = true
//
//        Cell12.translatesAutoresizingMaskIntoConstraints = false
//        Cell12.layer.borderColor = UIColor.black.cgColor
//        Cell12.layer.borderWidth = 2
//        Cell12.backgroundColor = .blue
//        Cell12.layer.cornerRadius = 5
//        Cell12.titleLabel?.textColor = .black
//        Cell12.topAnchor.constraint(equalTo: Cell1.bottomAnchor, constant: 10).isActive = true
//        Cell12.leftAnchor.constraint(equalTo: Cell11.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell12.rightAnchor.constraint(equalTo: Cell11.rightAnchor, constant: width2).isActive = true
//        Cell12.bottomAnchor.constraint(equalTo: Cell1.bottomAnchor, constant: 50).isActive = true
//
//        Cell13.translatesAutoresizingMaskIntoConstraints = false
//        Cell13.layer.borderColor = UIColor.black.cgColor
//        Cell13.layer.borderWidth = 2
//        Cell13.backgroundColor = .blue
//        Cell13.layer.cornerRadius = 5
//        Cell13.titleLabel?.textColor = .black
//        Cell13.topAnchor.constraint(equalTo: Cell1.bottomAnchor, constant: 10).isActive = true
//        Cell13.leftAnchor.constraint(equalTo: Cell12.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell13.rightAnchor.constraint(equalTo: Cell12.rightAnchor, constant: width2).isActive = true
//        Cell13.bottomAnchor.constraint(equalTo: Cell1.bottomAnchor, constant: 50).isActive = true
//
//        Cell14.translatesAutoresizingMaskIntoConstraints = false
//        Cell14.layer.borderColor = UIColor.black.cgColor
//        Cell14.layer.borderWidth = 2
//        Cell14.backgroundColor = .blue
//        Cell14.layer.cornerRadius = 5
//        Cell14.titleLabel?.textColor = .black
//        Cell14.topAnchor.constraint(equalTo: Cell1.bottomAnchor, constant: 10).isActive = true
//        Cell14.leftAnchor.constraint(equalTo: Cell13.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell14.rightAnchor.constraint(equalTo: Cell13.rightAnchor, constant: width2).isActive = true
//        Cell14.bottomAnchor.constraint(equalTo: Cell1.bottomAnchor, constant: 50).isActive = true
//
//        Cell15.translatesAutoresizingMaskIntoConstraints = false
//        Cell15.layer.borderColor = UIColor.black.cgColor
//        Cell15.layer.borderWidth = 2
//        Cell15.backgroundColor = .blue
//        Cell15.layer.cornerRadius = 5
//        Cell15.titleLabel?.textColor = .black
//        Cell15.topAnchor.constraint(equalTo: Cell8.bottomAnchor, constant: 10).isActive = true
//        Cell15.leftAnchor.constraint(equalTo: calendar.leftAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell15.rightAnchor.constraint(equalTo: calendar.leftAnchor, constant: width2).isActive = true
//        Cell15.bottomAnchor.constraint(equalTo: Cell8.bottomAnchor, constant: 50).isActive = true
//
//        Cell16.translatesAutoresizingMaskIntoConstraints = false
//        Cell16.layer.borderColor = UIColor.black.cgColor
//        Cell16.layer.borderWidth = 2
//        Cell16.backgroundColor = .blue
//        Cell16.layer.cornerRadius = 5
//        Cell16.titleLabel?.textColor = .black
//        Cell16.topAnchor.constraint(equalTo: Cell8.bottomAnchor, constant: 10).isActive = true
//        Cell16.leftAnchor.constraint(equalTo: Cell15.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell16.rightAnchor.constraint(equalTo: Cell15.rightAnchor, constant: width2).isActive = true
//        Cell16.bottomAnchor.constraint(equalTo: Cell8.bottomAnchor, constant: 50).isActive = true
//
//        Cell17.translatesAutoresizingMaskIntoConstraints = false
//        Cell17.layer.borderColor = UIColor.black.cgColor
//        Cell17.layer.borderWidth = 2
//        Cell17.backgroundColor = .blue
//        Cell17.layer.cornerRadius = 5
//        Cell17.titleLabel?.textColor = .black
//        Cell17.topAnchor.constraint(equalTo: Cell8.bottomAnchor, constant: 10).isActive = true
//        Cell17.leftAnchor.constraint(equalTo: Cell16.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell17.rightAnchor.constraint(equalTo: Cell16.rightAnchor, constant: width2).isActive = true
//        Cell17.bottomAnchor.constraint(equalTo: Cell8.bottomAnchor, constant: 50).isActive = true
//
//        Cell18.translatesAutoresizingMaskIntoConstraints = false
//        Cell18.layer.borderColor = UIColor.black.cgColor
//        Cell18.layer.borderWidth = 2
//        Cell18.backgroundColor = .blue
//        Cell18.layer.cornerRadius = 5
//        Cell18.titleLabel?.textColor = .black
//        Cell18.topAnchor.constraint(equalTo: Cell8.bottomAnchor, constant: 10).isActive = true
//        Cell18.leftAnchor.constraint(equalTo: Cell17.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell18.rightAnchor.constraint(equalTo: Cell17.rightAnchor, constant:  width2).isActive = true
//        Cell18.bottomAnchor.constraint(equalTo: Cell8.bottomAnchor, constant: 50).isActive = true
//
//        Cell19.translatesAutoresizingMaskIntoConstraints = false
//        Cell19.layer.borderColor = UIColor.black.cgColor
//        Cell19.layer.borderWidth = 2
//        Cell19.backgroundColor = .blue
//        Cell19.layer.cornerRadius = 5
//        Cell19.titleLabel?.textColor = .black
//        Cell19.topAnchor.constraint(equalTo: Cell8.bottomAnchor, constant: 10).isActive = true
//        Cell19.leftAnchor.constraint(equalTo: Cell18.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell19.rightAnchor.constraint(equalTo: Cell18.rightAnchor, constant: width2).isActive = true
//        Cell19.bottomAnchor.constraint(equalTo: Cell8.bottomAnchor, constant: 50).isActive = true
//
//        Cell20.translatesAutoresizingMaskIntoConstraints = false
//        Cell20.layer.borderColor = UIColor.black.cgColor
//        Cell20.layer.borderWidth = 2
//        Cell20.backgroundColor = .blue
//        Cell20.layer.cornerRadius = 5
//        Cell20.titleLabel?.textColor = .black
//        Cell20.topAnchor.constraint(equalTo: Cell8.bottomAnchor, constant: 10).isActive = true
//        Cell20.leftAnchor.constraint(equalTo: Cell19.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell20.rightAnchor.constraint(equalTo: Cell19.rightAnchor, constant: width2).isActive = true
//        Cell20.bottomAnchor.constraint(equalTo: Cell8.bottomAnchor, constant: 50).isActive = true
//
//        Cell21.translatesAutoresizingMaskIntoConstraints = false
//        Cell21.layer.borderColor = UIColor.black.cgColor
//        Cell21.layer.borderWidth = 2
//        Cell21.backgroundColor = .blue
//        Cell21.layer.cornerRadius = 5
//        Cell21.titleLabel?.textColor = .black
//        Cell21.topAnchor.constraint(equalTo: Cell8.bottomAnchor, constant: 10).isActive = true
//        Cell21.leftAnchor.constraint(equalTo: Cell20.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell21.rightAnchor.constraint(equalTo: Cell20.rightAnchor, constant: width2).isActive = true
//        Cell21.bottomAnchor.constraint(equalTo: Cell8.bottomAnchor, constant: 50).isActive = true
//
//        Cell22.translatesAutoresizingMaskIntoConstraints = false
//        Cell22.layer.borderColor = UIColor.black.cgColor
//        Cell22.layer.borderWidth = 2
//        Cell22.backgroundColor = .blue
//        Cell22.layer.cornerRadius = 5
//        Cell22.titleLabel?.textColor = .black
//        Cell22.topAnchor.constraint(equalTo: Cell15.bottomAnchor, constant: 10).isActive = true
//        Cell22.leftAnchor.constraint(equalTo: calendar.leftAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell22.rightAnchor.constraint(equalTo: calendar.leftAnchor, constant: width2).isActive = true
//        Cell22.bottomAnchor.constraint(equalTo: Cell15.bottomAnchor, constant: 50).isActive = true
//
//        Cell23.translatesAutoresizingMaskIntoConstraints = false
//        Cell23.layer.borderColor = UIColor.black.cgColor
//        Cell23.layer.borderWidth = 2
//        Cell23.backgroundColor = .blue
//        Cell23.layer.cornerRadius = 5
//        Cell23.titleLabel?.textColor = .black
//        Cell23.topAnchor.constraint(equalTo: Cell15.bottomAnchor, constant: 10).isActive = true
//        Cell23.leftAnchor.constraint(equalTo: Cell22.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell23.rightAnchor.constraint(equalTo: Cell22.rightAnchor, constant: width2).isActive = true
//        Cell23.bottomAnchor.constraint(equalTo: Cell15.bottomAnchor, constant: 50).isActive = true
//
//        Cell24.translatesAutoresizingMaskIntoConstraints = false
//        Cell24.layer.borderColor = UIColor.black.cgColor
//        Cell24.layer.borderWidth = 2
//        Cell24.backgroundColor = .blue
//        Cell24.layer.cornerRadius = 5
//        Cell24.titleLabel?.textColor = .black
//        Cell24.topAnchor.constraint(equalTo: Cell15.bottomAnchor, constant: 10).isActive = true
//        Cell24.leftAnchor.constraint(equalTo: Cell23.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell24.rightAnchor.constraint(equalTo: Cell23.rightAnchor, constant: width2).isActive = true
//        Cell24.bottomAnchor.constraint(equalTo: Cell15.bottomAnchor, constant: 50).isActive = true
//
//        Cell25.translatesAutoresizingMaskIntoConstraints = false
//        Cell25.layer.borderColor = UIColor.black.cgColor
//        Cell25.layer.borderWidth = 2
//        Cell25.backgroundColor = .blue
//        Cell25.layer.cornerRadius = 5
//        Cell25.titleLabel?.textColor = .black
//        Cell25.topAnchor.constraint(equalTo: Cell15.bottomAnchor, constant: 10).isActive = true
//        Cell25.leftAnchor.constraint(equalTo: Cell24.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell25.rightAnchor.constraint(equalTo: Cell24.rightAnchor, constant: width2).isActive = true
//        Cell25.bottomAnchor.constraint(equalTo: Cell15.bottomAnchor, constant: 50).isActive = true
//
//        Cell26.translatesAutoresizingMaskIntoConstraints = false
//        Cell26.layer.borderColor = UIColor.black.cgColor
//        Cell26.layer.borderWidth = 2
//        Cell26.backgroundColor = .blue
//        Cell26.layer.cornerRadius = 5
//        Cell26.titleLabel?.textColor = .black
//        Cell26.topAnchor.constraint(equalTo: Cell15.bottomAnchor, constant: 10).isActive = true
//        Cell26.leftAnchor.constraint(equalTo: Cell25.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell26.rightAnchor.constraint(equalTo: Cell25.rightAnchor, constant: width2).isActive = true
//        Cell26.bottomAnchor.constraint(equalTo: Cell15.bottomAnchor, constant: 50).isActive = true
//
//        Cell27.translatesAutoresizingMaskIntoConstraints = false
//        Cell27.layer.borderColor = UIColor.black.cgColor
//        Cell27.layer.borderWidth = 2
//        Cell27.backgroundColor = .blue
//        Cell27.layer.cornerRadius = 5
//        Cell27.titleLabel?.textColor = .black
//        Cell27.topAnchor.constraint(equalTo: Cell15.bottomAnchor, constant: 10).isActive = true
//        Cell27.leftAnchor.constraint(equalTo: Cell26.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell27.rightAnchor.constraint(equalTo: Cell26.rightAnchor, constant: width2).isActive = true
//        Cell27.bottomAnchor.constraint(equalTo: Cell15.bottomAnchor, constant: 50).isActive = true
//
//        Cell28.translatesAutoresizingMaskIntoConstraints = false
//        Cell28.layer.borderColor = UIColor.black.cgColor
//        Cell28.layer.borderWidth = 2
//        Cell28.backgroundColor = .blue
//        Cell28.layer.cornerRadius = 5
//        Cell28.titleLabel?.textColor = .black
//        Cell28.topAnchor.constraint(equalTo: Cell15.bottomAnchor, constant: 10).isActive = true
//        Cell28.leftAnchor.constraint(equalTo: Cell27.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell28.rightAnchor.constraint(equalTo: Cell27.rightAnchor, constant: width2).isActive = true
//        Cell28.bottomAnchor.constraint(equalTo: Cell15.bottomAnchor, constant: 50).isActive = true
//
//        Cell29.translatesAutoresizingMaskIntoConstraints = false
//        Cell29.layer.borderColor = UIColor.black.cgColor
//        Cell29.layer.borderWidth = 2
//        Cell29.backgroundColor = .blue
//        Cell29.layer.cornerRadius = 5
//        Cell29.titleLabel?.textColor = .black
//        Cell29.topAnchor.constraint(equalTo: Cell22.bottomAnchor, constant: 10).isActive = true
//        Cell29.leftAnchor.constraint(equalTo: calendar.leftAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell29.rightAnchor.constraint(equalTo: calendar.leftAnchor, constant: width2).isActive = true
//        Cell29.bottomAnchor.constraint(equalTo: Cell22.bottomAnchor, constant: 50).isActive = true
//
//        Cell30.translatesAutoresizingMaskIntoConstraints = false
//        Cell30.layer.borderColor = UIColor.black.cgColor
//        Cell30.layer.borderWidth = 2
//        Cell30.backgroundColor = .blue
//        Cell30.layer.cornerRadius = 5
//        Cell30.titleLabel?.textColor = .black
//        Cell30.topAnchor.constraint(equalTo: Cell22.bottomAnchor, constant: 10).isActive = true
//        Cell30.leftAnchor.constraint(equalTo: Cell29.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell30.rightAnchor.constraint(equalTo: Cell29.rightAnchor, constant: width2).isActive = true
//        Cell30.bottomAnchor.constraint(equalTo: Cell22.bottomAnchor, constant: 50).isActive = true
//
//        Cell31.translatesAutoresizingMaskIntoConstraints = false
//        Cell31.layer.borderColor = UIColor.black.cgColor
//        Cell31.layer.borderWidth = 2
//        Cell31.backgroundColor = .blue
//        Cell31.layer.cornerRadius = 5
//        Cell31.titleLabel?.textColor = .black
//        Cell31.topAnchor.constraint(equalTo: Cell22.bottomAnchor, constant: 10).isActive = true
//        Cell31.leftAnchor.constraint(equalTo: Cell30.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell31.rightAnchor.constraint(equalTo: Cell30.rightAnchor, constant: width2).isActive = true
//        Cell31.bottomAnchor.constraint(equalTo: Cell22.bottomAnchor, constant: 50).isActive = true
//
//        Cell32.translatesAutoresizingMaskIntoConstraints = false
//        Cell32.layer.borderColor = UIColor.black.cgColor
//        Cell32.layer.borderWidth = 2
//        Cell32.backgroundColor = .blue
//        Cell32.layer.cornerRadius = 5
//        Cell32.titleLabel?.textColor = .black
//        Cell32.topAnchor.constraint(equalTo: Cell22.bottomAnchor, constant: 10).isActive = true
//        Cell32.leftAnchor.constraint(equalTo: Cell31.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell32.rightAnchor.constraint(equalTo: Cell31.rightAnchor, constant: width2).isActive = true
//        Cell32.bottomAnchor.constraint(equalTo: Cell22.bottomAnchor, constant: 50).isActive = true
//
//        Cell33.translatesAutoresizingMaskIntoConstraints = false
//        Cell33.layer.borderColor = UIColor.black.cgColor
//        Cell33.layer.borderWidth = 2
//        Cell33.backgroundColor = .blue
//        Cell33.layer.cornerRadius = 5
//        Cell33.titleLabel?.textColor = .black
//        Cell33.topAnchor.constraint(equalTo: Cell22.bottomAnchor, constant: 10).isActive = true
//        Cell33.leftAnchor.constraint(equalTo: Cell32.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell33.rightAnchor.constraint(equalTo: Cell32.rightAnchor, constant: width2).isActive = true
//        Cell33.bottomAnchor.constraint(equalTo: Cell22.bottomAnchor, constant: 50).isActive = true
//
//        Cell34.translatesAutoresizingMaskIntoConstraints = false
//        Cell34.layer.borderColor = UIColor.black.cgColor
//        Cell34.layer.borderWidth = 2
//        Cell34.backgroundColor = .blue
//        Cell34.layer.cornerRadius = 5
//        Cell34.titleLabel?.textColor = .black
//        Cell34.topAnchor.constraint(equalTo: Cell22.bottomAnchor, constant: 10).isActive = true
//        Cell34.leftAnchor.constraint(equalTo: Cell33.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell34.rightAnchor.constraint(equalTo: Cell33.rightAnchor, constant: width2).isActive = true
//        Cell34.bottomAnchor.constraint(equalTo: Cell22.bottomAnchor, constant: 50).isActive = true
//
//        Cell35.translatesAutoresizingMaskIntoConstraints = false
//        Cell35.layer.borderColor = UIColor.black.cgColor
//        Cell35.layer.borderWidth = 2
//        Cell35.backgroundColor = .blue
//        Cell35.layer.cornerRadius = 5
//        Cell35.titleLabel?.textColor = .black
//        Cell35.topAnchor.constraint(equalTo: Cell22.bottomAnchor, constant: 10).isActive = true
//        Cell35.leftAnchor.constraint(equalTo: Cell34.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell35.rightAnchor.constraint(equalTo: Cell34.rightAnchor, constant: width2).isActive = true
//        Cell35.bottomAnchor.constraint(equalTo: Cell22.bottomAnchor, constant: 50).isActive = true
//
//        Cell36.translatesAutoresizingMaskIntoConstraints = false
//        Cell36.layer.borderColor = UIColor.black.cgColor
//        Cell36.layer.borderWidth = 2
//        Cell36.backgroundColor = .blue
//        Cell36.layer.cornerRadius = 5
//        Cell36.titleLabel?.textColor = .black
//        Cell36.topAnchor.constraint(equalTo: Cell29.bottomAnchor, constant: 10).isActive = true
//        Cell36.leftAnchor.constraint(equalTo: calendar.leftAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell36.rightAnchor.constraint(equalTo: calendar.leftAnchor, constant: width2).isActive = true
//        Cell36.bottomAnchor.constraint(equalTo: Cell29.bottomAnchor, constant: 50).isActive = true
//
//        Cell37.translatesAutoresizingMaskIntoConstraints = false
//        Cell37.layer.borderColor = UIColor.black.cgColor
//        Cell37.layer.borderWidth = 2
//        Cell37.backgroundColor = .blue
//        Cell37.layer.cornerRadius = 5
//        Cell37.titleLabel?.textColor = .black
//        Cell37.topAnchor.constraint(equalTo: Cell29.bottomAnchor, constant: 10).isActive = true
//        Cell37.leftAnchor.constraint(equalTo: Cell36.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell37.rightAnchor.constraint(equalTo: Cell36.rightAnchor, constant: width2).isActive = true
//        Cell37.bottomAnchor.constraint(equalTo: Cell29.bottomAnchor, constant: 50).isActive = true
//
//        calendar.bottomAnchor.constraint(equalTo: Cell37.bottomAnchor, constant: 10).isActive = true
//
//    }
//
//
//
//    func setYear(){
//        let optionClosure = {(action : UIAction) in print(action.title)}
//        year.menu = UIMenu(children : [
//            UIAction(title:"2015",  handler: optionClosure),
//            UIAction(title:"2016",  handler: optionClosure),
//            UIAction(title:"2017",  handler: optionClosure),
//            UIAction(title:"2018",  handler: optionClosure),
//            UIAction(title:"2019",  handler: optionClosure),
//            UIAction(title:"2020",  handler: optionClosure),
//            UIAction(title:"2021",  handler: optionClosure),
//            UIAction(title:"2022",  handler: optionClosure),
//            UIAction(title:"2023",  handler: optionClosure),
//            UIAction(title:"2024",  handler: optionClosure),
//            UIAction(title:"2025",  handler: optionClosure)
//        ])
//
//
//        year.showsMenuAsPrimaryAction = true
//        year.changesSelectionAsPrimaryAction = true
//    }
//
//
//    func setMonth(){
//        let optionClosure = {(action : UIAction) in print (action.title)}
//        month.menu = UIMenu(children : [
//            UIAction(title:"Январь",   handler: optionClosure),
//            UIAction(title:"Февраль",  handler: optionClosure),
//            UIAction(title:"Март",  handler: optionClosure),
//            UIAction(title:"Апрель",  handler: optionClosure),
//            UIAction(title:"Май",  handler: optionClosure),
//            UIAction(title:"Июнь",  handler: optionClosure),
//            UIAction(title:"Июль",  handler: optionClosure),
//            UIAction(title:"Август",  handler: optionClosure),
//            UIAction(title:"Сентябрь",  handler: optionClosure),
//            UIAction(title:"Октябрь",  handler: optionClosure),
//            UIAction(title:"Ноябрь", handler: optionClosure),
//            UIAction(title:"Декабрь",  handler: optionClosure)
//            ])
//
//
//        month.showsMenuAsPrimaryAction = true
//        month.changesSelectionAsPrimaryAction = true
//    }
//
//
//    private class CellOfData {
//        let activeLy : Bool
//        let chislo : Int
//        let today : Bool
//
//
//        init (activeLy: Bool,  chislo : Int, today: Bool){
//            self.activeLy = activeLy
//            self.chislo = chislo
//            self.today = today
//        }
//    }
//
//    func uniteCells () ->  [UIButton]{
//        return [Cell1, Cell2, Cell3, Cell4, Cell5, Cell6, Cell7, Cell8, Cell9, Cell10, Cell11, Cell12, Cell13, Cell14, Cell15, Cell16, Cell17, Cell18, Cell19, Cell20, Cell21, Cell22, Cell23, Cell24, Cell25, Cell26, Cell27, Cell28, Cell29, Cell30, Cell31, Cell32, Cell33, Cell34, Cell35, Cell36, Cell37]
//
//    }
//
//
//}
//extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 10
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCell", for: indexPath) as! MainCell
//        cell.dayAmount.text = String(17) + " \nдней"
//        cell.emoji.text = "💀"
//        cell.mainText.text = "Check all emails please"
//        return cell
//    }
//}
//
//
//
//>>>>>>> Stashed changes
//=======
//
//
//    func update(){
//
//        let thisYear: Int = Int(year
//            .currentTitle!)!
//        let thisMonth: Int
//
//        switch month.currentTitle!{
//            case "Январь":
//                thisMonth = 1
//            case "Февраль":
//                thisMonth = 2
//            case "Март":
//                thisMonth = 3
//            case "Апрель":
//                thisMonth = 4
//            case "Май":
//                thisMonth = 5
//            case "Июнь":
//                thisMonth = 6
//            case "Июль":
//                thisMonth = 7
//            case "Август":
//                thisMonth = 8
//            case "Сентябрь":
//                thisMonth = 9
//            case "Октябрь":
//                thisMonth = 10
//            case "Ноябрь":
//                thisMonth = 11
//            case "Декабрь":
//                thisMonth = 12
//            default :
//                thisMonth = 0
//                print("default")
//        }
//
//
//        let cells : [CellOfData] = monthYearToCells(year: thisYear, month: thisMonth)
//
//        let cellsView : [UIButton] = uniteCells()
//
//        for i in 1...37{
//            cellsView[i-1].setTitle(String(cells[i-1].chislo), for: .normal)
//            cellsView[i-1].isEnabled = cells[i-1].activeLy
//            cellsView[i-1].isHidden = !cells[i-1].activeLy
//
//
//            cellsView[i-1].setTitleColor( .black, for: .normal)
//            cellsView[i-1].setTitleColor( .white, for: .highlighted)
//            cellsView[i-1].backgroundColor = UIColor.customLightPurpleColor
//            cellsView[i-1].layer.cornerRadius = 5
//            cellsView[i-1].addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
//        }
//        selectMonthYaer.text = "\(year.currentTitle!)  \( month.currentTitle!)"
//        year.addTarget(self, action: #selector(didTapYear), for: .allEvents)
//        month.addTarget(self, action: #selector(didTapMonth), for: .allEvents)
//    }
//
//
//
//
//    @objc private func didTapYear(){
//        update()
//    }
//
//    @objc private func didTapMonth(){
//        update()
//    }
//
//    @objc private func didTapButton(){
//        update()
//    }
//
//    private func monthYearToCells (year:Int , month: Int) -> [CellOfData] {
//        let getDate = Date()
//        var dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "dd.MM.yyyy, HH:mm:ss"
//        print(dateFormatter.string(from: getDate))
//        dateFormatter.dateFormat = "dd, MMMM yyyy hh:mm" // в кавычках задается формат в котором хочешь видеть дату. В твоем случае надо dd/MM
//        print (dateFormatter.string(from: getDate))
//        dateFormatter.setLocalizedDateFormatFromTemplate("EEE MMM d yyyy")
//        print(dateFormatter.string(from: getDate))
//
//
//
//
//        let basicCell = CellOfData(activeLy: false, chislo: 0, today: false)
//        var cellsOfData : [CellOfData] = Array <CellOfData> (repeating:basicCell ,count: 37)
//
//
//        //----------------------------Col-vo cells---------------------------------
//
//        var dateComponents = DateComponents(year: year, month: month)
//        var calendar = Calendar.current
//        var date = calendar.date(from: dateComponents)!
//
//        let range = calendar.range(of: .day, in: .month, for: date)!
//        let colvoDays = range.count
//
//        //--------------------------first cell and kalendar---------------------------
//        dateComponents = DateComponents(year: year, month: month, day: 1)
//        calendar = Calendar.current
//        date = calendar.date(from: dateComponents)!
//        dateFormatter = DateFormatter()
//        dateFormatter.setLocalizedDateFormatFromTemplate("EEE")
//        let dayNedely = dateFormatter.string(from: date)
//
//        var numberOfFirstCell : Int
//
//        switch dayNedely {
//            case "Пн":
//                numberOfFirstCell = 1
//            case "Вт":
//                numberOfFirstCell = 2
//            case "Ср":
//                numberOfFirstCell = 3
//            case "Чт":
//                numberOfFirstCell = 4
//            case "Пт":
//                numberOfFirstCell = 5
//            case "Сб":
//                numberOfFirstCell = 6
//            case "Вс":
//                numberOfFirstCell = 7
//            default :
//                numberOfFirstCell = 0
//                print("default")
//        }
//
//
//
//        for i in numberOfFirstCell...(colvoDays + numberOfFirstCell-1) {
//            cellsOfData [i-1] = CellOfData(activeLy: true,  chislo: i-numberOfFirstCell+1, today: false)
//        }
//
//
//
//        return cellsOfData
//    }
//
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        year.backgroundColor = .purple
//        year.translatesAutoresizingMaskIntoConstraints = false
//        year.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
//        year.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
//        year.rightAnchor.constraint(equalTo: view.centerXAnchor, constant: -10).isActive = true
//        year.layer.borderColor = UIColor.black.cgColor
//        year.layer.borderWidth = 2
//        year.layer.cornerRadius = year.frame.height/2
//
//        month.translatesAutoresizingMaskIntoConstraints = false
//        month.backgroundColor = .purple
//        month.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
//        month.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: 10).isActive = true
//        month.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
//        month.layer.borderColor = UIColor.black.cgColor
//        month.layer.borderWidth = 2
//        month.layer.cornerRadius = year.frame.height/2
//
//
//        calendar.backgroundColor = .purple
//        calendar.layer.cornerRadius = 10
//        calendar.translatesAutoresizingMaskIntoConstraints = false
//        calendar.topAnchor.constraint(equalTo: month.bottomAnchor, constant: 20).isActive = true
//        calendar.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
//        calendar.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
//        calendar.layer.borderColor = UIColor.black.cgColor
//        calendar.layer.borderWidth = 2
//
//
//
//        selectMonthYaer.backgroundColor = .purple
//        selectMonthYaer.layer.cornerRadius = 10
//        selectMonthYaer.translatesAutoresizingMaskIntoConstraints = false
//        selectMonthYaer.topAnchor.constraint(equalTo: calendar.topAnchor, constant: 5).isActive = true
//        selectMonthYaer.leftAnchor.constraint(equalTo: calendar.leftAnchor, constant: 10).isActive = true
//        selectMonthYaer.rightAnchor.constraint(equalTo: calendar.rightAnchor, constant: -10).isActive = true
//        selectMonthYaer.textAlignment = .center
//
//
//
//        //ONLY BUTTON ONLY HARDCOOOOORE
//        let widthOfCalendar = CGFloat(view.safeAreaLayoutGuide.layoutFrame.width - 20)
//
//        let widthOfCellsCalendar = CGFloat(widthOfCalendar  * 0.1)
//        let distanceBetweenObjects = CGFloat((widthOfCalendar - CGFloat(7 * widthOfCellsCalendar)) * 0.125)
//        let width2 = widthOfCellsCalendar + distanceBetweenObjects
//        print (" \(widthOfCalendar)   \(widthOfCellsCalendar)    \(distanceBetweenObjects) \n \n \n \n \n \n \n \n \n \n \n \n")
//
//        Cell1.translatesAutoresizingMaskIntoConstraints = false
//        Cell1.layer.borderColor = UIColor.black.cgColor
//        Cell1.layer.borderWidth = 2
//        Cell1.backgroundColor = .blue
//        Cell1.layer.cornerRadius = 5
//        Cell1.titleLabel?.textColor = .black
//        Cell1.topAnchor.constraint(equalTo: selectMonthYaer.bottomAnchor, constant: 20).isActive = true
//        Cell1.leftAnchor.constraint(equalTo: calendar.leftAnchor, constant: distanceBetweenObjects ).isActive = true
//        Cell1.rightAnchor.constraint(equalTo: calendar.leftAnchor, constant: width2 ).isActive = true
//        Cell1.bottomAnchor.constraint(equalTo: selectMonthYaer.bottomAnchor, constant: 60).isActive = true
//
//        Cell2.translatesAutoresizingMaskIntoConstraints = false
//        Cell2.layer.borderColor = UIColor.black.cgColor
//        Cell2.layer.borderWidth = 2
//        Cell2.backgroundColor = .blue
//        Cell2.layer.cornerRadius = 5
//        Cell2.titleLabel?.textColor = .black
//        Cell2.topAnchor.constraint(equalTo: selectMonthYaer.bottomAnchor, constant: 20).isActive = true
//        Cell2.leftAnchor.constraint(equalTo: Cell1.rightAnchor, constant: distanceBetweenObjects ).isActive = true
//        Cell2.rightAnchor.constraint(equalTo: Cell1.rightAnchor, constant: width2 ).isActive = true
//        Cell2.bottomAnchor.constraint(equalTo: selectMonthYaer.bottomAnchor, constant: 60).isActive = true
//
//        Cell3.translatesAutoresizingMaskIntoConstraints = false
//        Cell3.layer.borderColor = UIColor.black.cgColor
//        Cell3.layer.borderWidth = 2
//        Cell3.backgroundColor = .blue
//        Cell3.layer.cornerRadius = 5
//        Cell3.titleLabel?.textColor = .black
//        Cell3.topAnchor.constraint(equalTo: selectMonthYaer.bottomAnchor,constant: 20).isActive = true
//        Cell3.leftAnchor.constraint(equalTo: Cell2.rightAnchor,constant: distanceBetweenObjects).isActive = true
//        Cell3.rightAnchor.constraint(equalTo: Cell2.rightAnchor, constant: width2).isActive = true
//        Cell3.bottomAnchor.constraint(equalTo: selectMonthYaer.bottomAnchor, constant: 60).isActive = true
//
//        Cell4.translatesAutoresizingMaskIntoConstraints = false
//        Cell4.layer.borderColor = UIColor.black.cgColor
//        Cell4.layer.borderWidth = 2
//        Cell4.backgroundColor = .blue
//        Cell4.layer.cornerRadius = 5
//        Cell4.titleLabel?.textColor = .black
//        Cell4.topAnchor.constraint(equalTo: selectMonthYaer.bottomAnchor, constant: 20).isActive = true
//        Cell4.leftAnchor.constraint(equalTo: Cell3.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell4.rightAnchor.constraint(equalTo: Cell3.rightAnchor, constant: width2).isActive = true
//        Cell4.bottomAnchor.constraint(equalTo: selectMonthYaer.bottomAnchor, constant: 60).isActive = true
//
//        Cell5.translatesAutoresizingMaskIntoConstraints = false
//        Cell5.layer.borderColor = UIColor.black.cgColor
//        Cell5.layer.borderWidth = 2
//        Cell5.backgroundColor = .blue
//        Cell5.layer.cornerRadius = 5
//        Cell5.titleLabel?.textColor = .black
//        Cell5.topAnchor.constraint(equalTo: selectMonthYaer.bottomAnchor, constant: 20).isActive = true
//        Cell5.leftAnchor.constraint(equalTo: Cell4.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell5.rightAnchor.constraint(equalTo: Cell4.rightAnchor, constant: width2).isActive = true
//        Cell5.bottomAnchor.constraint(equalTo: selectMonthYaer.bottomAnchor, constant: 60).isActive = true
//
//        Cell6.translatesAutoresizingMaskIntoConstraints = false
//        Cell6.layer.borderColor = UIColor.black.cgColor
//        Cell6.layer.borderWidth = 2
//        Cell6.backgroundColor = .blue
//        Cell6.layer.cornerRadius = 5
//        Cell6.titleLabel?.textColor = .black
//        Cell6.topAnchor.constraint(equalTo: selectMonthYaer.bottomAnchor, constant: 20).isActive = true
//        Cell6.leftAnchor.constraint(equalTo: Cell5.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell6.rightAnchor.constraint(equalTo: Cell5.rightAnchor, constant: width2).isActive = true
//        Cell6.bottomAnchor.constraint(equalTo: selectMonthYaer.bottomAnchor, constant: 60).isActive = true
//
//        Cell7.translatesAutoresizingMaskIntoConstraints = false
//        Cell7.layer.borderColor = UIColor.black.cgColor
//        Cell7.layer.borderWidth = 2
//        Cell7.backgroundColor = .blue
//        Cell7.layer.cornerRadius = 5
//        Cell7.titleLabel?.textColor = .black
//        Cell7.topAnchor.constraint(equalTo: selectMonthYaer.bottomAnchor, constant: 20).isActive = true
//        Cell7.leftAnchor.constraint(equalTo: Cell6.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell7.rightAnchor.constraint(equalTo: Cell6.rightAnchor, constant: width2).isActive = true
//        Cell7.bottomAnchor.constraint(equalTo: selectMonthYaer.bottomAnchor, constant: 60).isActive = true
//
//        Cell8.translatesAutoresizingMaskIntoConstraints = false
//        Cell8.layer.borderColor = UIColor.black.cgColor
//        Cell8.layer.borderWidth = 2
//        Cell8.backgroundColor = .blue
//        Cell8.layer.cornerRadius = 5
//        Cell8.titleLabel?.textColor = .black
//        Cell8.topAnchor.constraint(equalTo: Cell1.bottomAnchor, constant: 10).isActive = true
//        Cell8.leftAnchor.constraint(equalTo: calendar.leftAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell8.rightAnchor.constraint(equalTo: calendar.leftAnchor, constant: width2).isActive = true
//        Cell8.bottomAnchor.constraint(equalTo: Cell1.bottomAnchor, constant: 50).isActive = true
//
//        Cell9.translatesAutoresizingMaskIntoConstraints = false
//        Cell9.layer.borderColor = UIColor.black.cgColor
//        Cell9.layer.borderWidth = 2
//        Cell9.backgroundColor = .blue
//        Cell9.layer.cornerRadius = 5
//        Cell9.titleLabel?.textColor = .black
//        Cell9.topAnchor.constraint(equalTo: Cell1.bottomAnchor, constant: 10).isActive = true
//        Cell9.leftAnchor.constraint(equalTo: Cell8.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell9.rightAnchor.constraint(equalTo: Cell8.rightAnchor, constant: width2).isActive = true
//        Cell9.bottomAnchor.constraint(equalTo: Cell1.bottomAnchor, constant: 50).isActive = true
//
//        Cell10.translatesAutoresizingMaskIntoConstraints = false
//        Cell10.layer.borderColor = UIColor.black.cgColor
//        Cell10.layer.borderWidth = 2
//        Cell10.backgroundColor = .blue
//        Cell10.layer.cornerRadius = 5
//        Cell10.titleLabel?.textColor = .black
//        Cell10.topAnchor.constraint(equalTo: Cell1.bottomAnchor, constant: 10).isActive = true
//        Cell10.leftAnchor.constraint(equalTo: Cell9.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell10.rightAnchor.constraint(equalTo: Cell9.rightAnchor, constant: width2).isActive = true
//        Cell10.bottomAnchor.constraint(equalTo: Cell1.bottomAnchor, constant: 50).isActive = true
//
//        Cell11.translatesAutoresizingMaskIntoConstraints = false
//        Cell11.layer.borderColor = UIColor.black.cgColor
//        Cell11.layer.borderWidth = 2
//        Cell11.backgroundColor = .blue
//        Cell11.layer.cornerRadius = 5
//        Cell11.titleLabel?.textColor = .black
//        Cell11.topAnchor.constraint(equalTo: Cell1.bottomAnchor, constant: 10).isActive = true
//        Cell11.leftAnchor.constraint(equalTo: Cell10.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell11.rightAnchor.constraint(equalTo: Cell10.rightAnchor, constant: width2).isActive = true
//        Cell11.bottomAnchor.constraint(equalTo: Cell1.bottomAnchor, constant: 50).isActive = true
//
//        Cell12.translatesAutoresizingMaskIntoConstraints = false
//        Cell12.layer.borderColor = UIColor.black.cgColor
//        Cell12.layer.borderWidth = 2
//        Cell12.backgroundColor = .blue
//        Cell12.layer.cornerRadius = 5
//        Cell12.titleLabel?.textColor = .black
//        Cell12.topAnchor.constraint(equalTo: Cell1.bottomAnchor, constant: 10).isActive = true
//        Cell12.leftAnchor.constraint(equalTo: Cell11.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell12.rightAnchor.constraint(equalTo: Cell11.rightAnchor, constant: width2).isActive = true
//        Cell12.bottomAnchor.constraint(equalTo: Cell1.bottomAnchor, constant: 50).isActive = true
//
//        Cell13.translatesAutoresizingMaskIntoConstraints = false
//        Cell13.layer.borderColor = UIColor.black.cgColor
//        Cell13.layer.borderWidth = 2
//        Cell13.backgroundColor = .blue
//        Cell13.layer.cornerRadius = 5
//        Cell13.titleLabel?.textColor = .black
//        Cell13.topAnchor.constraint(equalTo: Cell1.bottomAnchor, constant: 10).isActive = true
//        Cell13.leftAnchor.constraint(equalTo: Cell12.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell13.rightAnchor.constraint(equalTo: Cell12.rightAnchor, constant: width2).isActive = true
//        Cell13.bottomAnchor.constraint(equalTo: Cell1.bottomAnchor, constant: 50).isActive = true
//
//        Cell14.translatesAutoresizingMaskIntoConstraints = false
//        Cell14.layer.borderColor = UIColor.black.cgColor
//        Cell14.layer.borderWidth = 2
//        Cell14.backgroundColor = .blue
//        Cell14.layer.cornerRadius = 5
//        Cell14.titleLabel?.textColor = .black
//        Cell14.topAnchor.constraint(equalTo: Cell1.bottomAnchor, constant: 10).isActive = true
//        Cell14.leftAnchor.constraint(equalTo: Cell13.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell14.rightAnchor.constraint(equalTo: Cell13.rightAnchor, constant: width2).isActive = true
//        Cell14.bottomAnchor.constraint(equalTo: Cell1.bottomAnchor, constant: 50).isActive = true
//
//        Cell15.translatesAutoresizingMaskIntoConstraints = false
//        Cell15.layer.borderColor = UIColor.black.cgColor
//        Cell15.layer.borderWidth = 2
//        Cell15.backgroundColor = .blue
//        Cell15.layer.cornerRadius = 5
//        Cell15.titleLabel?.textColor = .black
//        Cell15.topAnchor.constraint(equalTo: Cell8.bottomAnchor, constant: 10).isActive = true
//        Cell15.leftAnchor.constraint(equalTo: calendar.leftAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell15.rightAnchor.constraint(equalTo: calendar.leftAnchor, constant: width2).isActive = true
//        Cell15.bottomAnchor.constraint(equalTo: Cell8.bottomAnchor, constant: 50).isActive = true
//
//        Cell16.translatesAutoresizingMaskIntoConstraints = false
//        Cell16.layer.borderColor = UIColor.black.cgColor
//        Cell16.layer.borderWidth = 2
//        Cell16.backgroundColor = .blue
//        Cell16.layer.cornerRadius = 5
//        Cell16.titleLabel?.textColor = .black
//        Cell16.topAnchor.constraint(equalTo: Cell8.bottomAnchor, constant: 10).isActive = true
//        Cell16.leftAnchor.constraint(equalTo: Cell15.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell16.rightAnchor.constraint(equalTo: Cell15.rightAnchor, constant: width2).isActive = true
//        Cell16.bottomAnchor.constraint(equalTo: Cell8.bottomAnchor, constant: 50).isActive = true
//
//        Cell17.translatesAutoresizingMaskIntoConstraints = false
//        Cell17.layer.borderColor = UIColor.black.cgColor
//        Cell17.layer.borderWidth = 2
//        Cell17.backgroundColor = .blue
//        Cell17.layer.cornerRadius = 5
//        Cell17.titleLabel?.textColor = .black
//        Cell17.topAnchor.constraint(equalTo: Cell8.bottomAnchor, constant: 10).isActive = true
//        Cell17.leftAnchor.constraint(equalTo: Cell16.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell17.rightAnchor.constraint(equalTo: Cell16.rightAnchor, constant: width2).isActive = true
//        Cell17.bottomAnchor.constraint(equalTo: Cell8.bottomAnchor, constant: 50).isActive = true
//
//        Cell18.translatesAutoresizingMaskIntoConstraints = false
//        Cell18.layer.borderColor = UIColor.black.cgColor
//        Cell18.layer.borderWidth = 2
//        Cell18.backgroundColor = .blue
//        Cell18.layer.cornerRadius = 5
//        Cell18.titleLabel?.textColor = .black
//        Cell18.topAnchor.constraint(equalTo: Cell8.bottomAnchor, constant: 10).isActive = true
//        Cell18.leftAnchor.constraint(equalTo: Cell17.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell18.rightAnchor.constraint(equalTo: Cell17.rightAnchor, constant:  width2).isActive = true
//        Cell18.bottomAnchor.constraint(equalTo: Cell8.bottomAnchor, constant: 50).isActive = true
//
//        Cell19.translatesAutoresizingMaskIntoConstraints = false
//        Cell19.layer.borderColor = UIColor.black.cgColor
//        Cell19.layer.borderWidth = 2
//        Cell19.backgroundColor = .blue
//        Cell19.layer.cornerRadius = 5
//        Cell19.titleLabel?.textColor = .black
//        Cell19.topAnchor.constraint(equalTo: Cell8.bottomAnchor, constant: 10).isActive = true
//        Cell19.leftAnchor.constraint(equalTo: Cell18.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell19.rightAnchor.constraint(equalTo: Cell18.rightAnchor, constant: width2).isActive = true
//        Cell19.bottomAnchor.constraint(equalTo: Cell8.bottomAnchor, constant: 50).isActive = true
//
//        Cell20.translatesAutoresizingMaskIntoConstraints = false
//        Cell20.layer.borderColor = UIColor.black.cgColor
//        Cell20.layer.borderWidth = 2
//        Cell20.backgroundColor = .blue
//        Cell20.layer.cornerRadius = 5
//        Cell20.titleLabel?.textColor = .black
//        Cell20.topAnchor.constraint(equalTo: Cell8.bottomAnchor, constant: 10).isActive = true
//        Cell20.leftAnchor.constraint(equalTo: Cell19.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell20.rightAnchor.constraint(equalTo: Cell19.rightAnchor, constant: width2).isActive = true
//        Cell20.bottomAnchor.constraint(equalTo: Cell8.bottomAnchor, constant: 50).isActive = true
//
//        Cell21.translatesAutoresizingMaskIntoConstraints = false
//        Cell21.layer.borderColor = UIColor.black.cgColor
//        Cell21.layer.borderWidth = 2
//        Cell21.backgroundColor = .blue
//        Cell21.layer.cornerRadius = 5
//        Cell21.titleLabel?.textColor = .black
//        Cell21.topAnchor.constraint(equalTo: Cell8.bottomAnchor, constant: 10).isActive = true
//        Cell21.leftAnchor.constraint(equalTo: Cell20.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell21.rightAnchor.constraint(equalTo: Cell20.rightAnchor, constant: width2).isActive = true
//        Cell21.bottomAnchor.constraint(equalTo: Cell8.bottomAnchor, constant: 50).isActive = true
//
//        Cell22.translatesAutoresizingMaskIntoConstraints = false
//        Cell22.layer.borderColor = UIColor.black.cgColor
//        Cell22.layer.borderWidth = 2
//        Cell22.backgroundColor = .blue
//        Cell22.layer.cornerRadius = 5
//        Cell22.titleLabel?.textColor = .black
//        Cell22.topAnchor.constraint(equalTo: Cell15.bottomAnchor, constant: 10).isActive = true
//        Cell22.leftAnchor.constraint(equalTo: calendar.leftAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell22.rightAnchor.constraint(equalTo: calendar.leftAnchor, constant: width2).isActive = true
//        Cell22.bottomAnchor.constraint(equalTo: Cell15.bottomAnchor, constant: 50).isActive = true
//
//        Cell23.translatesAutoresizingMaskIntoConstraints = false
//        Cell23.layer.borderColor = UIColor.black.cgColor
//        Cell23.layer.borderWidth = 2
//        Cell23.backgroundColor = .blue
//        Cell23.layer.cornerRadius = 5
//        Cell23.titleLabel?.textColor = .black
//        Cell23.topAnchor.constraint(equalTo: Cell15.bottomAnchor, constant: 10).isActive = true
//        Cell23.leftAnchor.constraint(equalTo: Cell22.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell23.rightAnchor.constraint(equalTo: Cell22.rightAnchor, constant: width2).isActive = true
//        Cell23.bottomAnchor.constraint(equalTo: Cell15.bottomAnchor, constant: 50).isActive = true
//
//        Cell24.translatesAutoresizingMaskIntoConstraints = false
//        Cell24.layer.borderColor = UIColor.black.cgColor
//        Cell24.layer.borderWidth = 2
//        Cell24.backgroundColor = .blue
//        Cell24.layer.cornerRadius = 5
//        Cell24.titleLabel?.textColor = .black
//        Cell24.topAnchor.constraint(equalTo: Cell15.bottomAnchor, constant: 10).isActive = true
//        Cell24.leftAnchor.constraint(equalTo: Cell23.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell24.rightAnchor.constraint(equalTo: Cell23.rightAnchor, constant: width2).isActive = true
//        Cell24.bottomAnchor.constraint(equalTo: Cell15.bottomAnchor, constant: 50).isActive = true
//
//        Cell25.translatesAutoresizingMaskIntoConstraints = false
//        Cell25.layer.borderColor = UIColor.black.cgColor
//        Cell25.layer.borderWidth = 2
//        Cell25.backgroundColor = .blue
//        Cell25.layer.cornerRadius = 5
//        Cell25.titleLabel?.textColor = .black
//        Cell25.topAnchor.constraint(equalTo: Cell15.bottomAnchor, constant: 10).isActive = true
//        Cell25.leftAnchor.constraint(equalTo: Cell24.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell25.rightAnchor.constraint(equalTo: Cell24.rightAnchor, constant: width2).isActive = true
//        Cell25.bottomAnchor.constraint(equalTo: Cell15.bottomAnchor, constant: 50).isActive = true
//
//        Cell26.translatesAutoresizingMaskIntoConstraints = false
//        Cell26.layer.borderColor = UIColor.black.cgColor
//        Cell26.layer.borderWidth = 2
//        Cell26.backgroundColor = .blue
//        Cell26.layer.cornerRadius = 5
//        Cell26.titleLabel?.textColor = .black
//        Cell26.topAnchor.constraint(equalTo: Cell15.bottomAnchor, constant: 10).isActive = true
//        Cell26.leftAnchor.constraint(equalTo: Cell25.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell26.rightAnchor.constraint(equalTo: Cell25.rightAnchor, constant: width2).isActive = true
//        Cell26.bottomAnchor.constraint(equalTo: Cell15.bottomAnchor, constant: 50).isActive = true
//
//        Cell27.translatesAutoresizingMaskIntoConstraints = false
//        Cell27.layer.borderColor = UIColor.black.cgColor
//        Cell27.layer.borderWidth = 2
//        Cell27.backgroundColor = .blue
//        Cell27.layer.cornerRadius = 5
//        Cell27.titleLabel?.textColor = .black
//        Cell27.topAnchor.constraint(equalTo: Cell15.bottomAnchor, constant: 10).isActive = true
//        Cell27.leftAnchor.constraint(equalTo: Cell26.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell27.rightAnchor.constraint(equalTo: Cell26.rightAnchor, constant: width2).isActive = true
//        Cell27.bottomAnchor.constraint(equalTo: Cell15.bottomAnchor, constant: 50).isActive = true
//
//        Cell28.translatesAutoresizingMaskIntoConstraints = false
//        Cell28.layer.borderColor = UIColor.black.cgColor
//        Cell28.layer.borderWidth = 2
//        Cell28.backgroundColor = .blue
//        Cell28.layer.cornerRadius = 5
//        Cell28.titleLabel?.textColor = .black
//        Cell28.topAnchor.constraint(equalTo: Cell15.bottomAnchor, constant: 10).isActive = true
//        Cell28.leftAnchor.constraint(equalTo: Cell27.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell28.rightAnchor.constraint(equalTo: Cell27.rightAnchor, constant: width2).isActive = true
//        Cell28.bottomAnchor.constraint(equalTo: Cell15.bottomAnchor, constant: 50).isActive = true
//
//        Cell29.translatesAutoresizingMaskIntoConstraints = false
//        Cell29.layer.borderColor = UIColor.black.cgColor
//        Cell29.layer.borderWidth = 2
//        Cell29.backgroundColor = .blue
//        Cell29.layer.cornerRadius = 5
//        Cell29.titleLabel?.textColor = .black
//        Cell29.topAnchor.constraint(equalTo: Cell22.bottomAnchor, constant: 10).isActive = true
//        Cell29.leftAnchor.constraint(equalTo: calendar.leftAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell29.rightAnchor.constraint(equalTo: calendar.leftAnchor, constant: width2).isActive = true
//        Cell29.bottomAnchor.constraint(equalTo: Cell22.bottomAnchor, constant: 50).isActive = true
//
//        Cell30.translatesAutoresizingMaskIntoConstraints = false
//        Cell30.layer.borderColor = UIColor.black.cgColor
//        Cell30.layer.borderWidth = 2
//        Cell30.backgroundColor = .blue
//        Cell30.layer.cornerRadius = 5
//        Cell30.titleLabel?.textColor = .black
//        Cell30.topAnchor.constraint(equalTo: Cell22.bottomAnchor, constant: 10).isActive = true
//        Cell30.leftAnchor.constraint(equalTo: Cell29.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell30.rightAnchor.constraint(equalTo: Cell29.rightAnchor, constant: width2).isActive = true
//        Cell30.bottomAnchor.constraint(equalTo: Cell22.bottomAnchor, constant: 50).isActive = true
//
//        Cell31.translatesAutoresizingMaskIntoConstraints = false
//        Cell31.layer.borderColor = UIColor.black.cgColor
//        Cell31.layer.borderWidth = 2
//        Cell31.backgroundColor = .blue
//        Cell31.layer.cornerRadius = 5
//        Cell31.titleLabel?.textColor = .black
//        Cell31.topAnchor.constraint(equalTo: Cell22.bottomAnchor, constant: 10).isActive = true
//        Cell31.leftAnchor.constraint(equalTo: Cell30.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell31.rightAnchor.constraint(equalTo: Cell30.rightAnchor, constant: width2).isActive = true
//        Cell31.bottomAnchor.constraint(equalTo: Cell22.bottomAnchor, constant: 50).isActive = true
//
//        Cell32.translatesAutoresizingMaskIntoConstraints = false
//        Cell32.layer.borderColor = UIColor.black.cgColor
//        Cell32.layer.borderWidth = 2
//        Cell32.backgroundColor = .blue
//        Cell32.layer.cornerRadius = 5
//        Cell32.titleLabel?.textColor = .black
//        Cell32.topAnchor.constraint(equalTo: Cell22.bottomAnchor, constant: 10).isActive = true
//        Cell32.leftAnchor.constraint(equalTo: Cell31.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell32.rightAnchor.constraint(equalTo: Cell31.rightAnchor, constant: width2).isActive = true
//        Cell32.bottomAnchor.constraint(equalTo: Cell22.bottomAnchor, constant: 50).isActive = true
//
//        Cell33.translatesAutoresizingMaskIntoConstraints = false
//        Cell33.layer.borderColor = UIColor.black.cgColor
//        Cell33.layer.borderWidth = 2
//        Cell33.backgroundColor = .blue
//        Cell33.layer.cornerRadius = 5
//        Cell33.titleLabel?.textColor = .black
//        Cell33.topAnchor.constraint(equalTo: Cell22.bottomAnchor, constant: 10).isActive = true
//        Cell33.leftAnchor.constraint(equalTo: Cell32.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell33.rightAnchor.constraint(equalTo: Cell32.rightAnchor, constant: width2).isActive = true
//        Cell33.bottomAnchor.constraint(equalTo: Cell22.bottomAnchor, constant: 50).isActive = true
//
//        Cell34.translatesAutoresizingMaskIntoConstraints = false
//        Cell34.layer.borderColor = UIColor.black.cgColor
//        Cell34.layer.borderWidth = 2
//        Cell34.backgroundColor = .blue
//        Cell34.layer.cornerRadius = 5
//        Cell34.titleLabel?.textColor = .black
//        Cell34.topAnchor.constraint(equalTo: Cell22.bottomAnchor, constant: 10).isActive = true
//        Cell34.leftAnchor.constraint(equalTo: Cell33.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell34.rightAnchor.constraint(equalTo: Cell33.rightAnchor, constant: width2).isActive = true
//        Cell34.bottomAnchor.constraint(equalTo: Cell22.bottomAnchor, constant: 50).isActive = true
//
//        Cell35.translatesAutoresizingMaskIntoConstraints = false
//        Cell35.layer.borderColor = UIColor.black.cgColor
//        Cell35.layer.borderWidth = 2
//        Cell35.backgroundColor = .blue
//        Cell35.layer.cornerRadius = 5
//        Cell35.titleLabel?.textColor = .black
//        Cell35.topAnchor.constraint(equalTo: Cell22.bottomAnchor, constant: 10).isActive = true
//        Cell35.leftAnchor.constraint(equalTo: Cell34.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell35.rightAnchor.constraint(equalTo: Cell34.rightAnchor, constant: width2).isActive = true
//        Cell35.bottomAnchor.constraint(equalTo: Cell22.bottomAnchor, constant: 50).isActive = true
//
//        Cell36.translatesAutoresizingMaskIntoConstraints = false
//        Cell36.layer.borderColor = UIColor.black.cgColor
//        Cell36.layer.borderWidth = 2
//        Cell36.backgroundColor = .blue
//        Cell36.layer.cornerRadius = 5
//        Cell36.titleLabel?.textColor = .black
//        Cell36.topAnchor.constraint(equalTo: Cell29.bottomAnchor, constant: 10).isActive = true
//        Cell36.leftAnchor.constraint(equalTo: calendar.leftAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell36.rightAnchor.constraint(equalTo: calendar.leftAnchor, constant: width2).isActive = true
//        Cell36.bottomAnchor.constraint(equalTo: Cell29.bottomAnchor, constant: 50).isActive = true
//
//        Cell37.translatesAutoresizingMaskIntoConstraints = false
//        Cell37.layer.borderColor = UIColor.black.cgColor
//        Cell37.layer.borderWidth = 2
//        Cell37.backgroundColor = .blue
//        Cell37.layer.cornerRadius = 5
//        Cell37.titleLabel?.textColor = .black
//        Cell37.topAnchor.constraint(equalTo: Cell29.bottomAnchor, constant: 10).isActive = true
//        Cell37.leftAnchor.constraint(equalTo: Cell36.rightAnchor, constant: distanceBetweenObjects).isActive = true
//        Cell37.rightAnchor.constraint(equalTo: Cell36.rightAnchor, constant: width2).isActive = true
//        Cell37.bottomAnchor.constraint(equalTo: Cell29.bottomAnchor, constant: 50).isActive = true
//
//        calendar.bottomAnchor.constraint(equalTo: Cell37.bottomAnchor, constant: -10).isActive = true
//
//    }
//
//
//
//    func setYear(){
//        let optionClosure = {(action : UIAction) in print(action.title)}
//        year.menu = UIMenu(children : [
//            UIAction(title:"2015",  handler: optionClosure),
//            UIAction(title:"2016",  handler: optionClosure),
//            UIAction(title:"2017",  handler: optionClosure),
//            UIAction(title:"2018",  handler: optionClosure),
//            UIAction(title:"2019",  handler: optionClosure),
//            UIAction(title:"2020",  handler: optionClosure),
//            UIAction(title:"2021",  handler: optionClosure),
//            UIAction(title:"2022",  handler: optionClosure),
//            UIAction(title:"2023",  handler: optionClosure),
//            UIAction(title:"2024",  handler: optionClosure),
//            UIAction(title:"2025",  handler: optionClosure)
//        ])
//
//
//        year.showsMenuAsPrimaryAction = true
//        year.changesSelectionAsPrimaryAction = true
//    }
//
//
//    func setMonth(){
//        let optionClosure = {(action : UIAction) in print (action.title)}
//        month.menu = UIMenu(children : [
//            UIAction(title:"Январь",   handler: optionClosure),
//            UIAction(title:"Февраль",  handler: optionClosure),
//            UIAction(title:"Март",  handler: optionClosure),
//            UIAction(title:"Апрель",  handler: optionClosure),
//            UIAction(title:"Май",  handler: optionClosure),
//            UIAction(title:"Июнь",  handler: optionClosure),
//            UIAction(title:"Июль",  handler: optionClosure),
//            UIAction(title:"Август",  handler: optionClosure),
//            UIAction(title:"Сентябрь",  handler: optionClosure),
//            UIAction(title:"Октябрь",  handler: optionClosure),
//            UIAction(title:"Ноябрь", handler: optionClosure),
//            UIAction(title:"Декабрь",  handler: optionClosure)
//            ])
//
//
//        month.showsMenuAsPrimaryAction = true
//        month.changesSelectionAsPrimaryAction = true
//    }
//
//
//    private class CellOfData {
//        let activeLy : Bool
//        let chislo : Int
//        let today : Bool
//
//
//        init (activeLy: Bool,  chislo : Int, today: Bool){
//            self.activeLy = activeLy
//            self.chislo = chislo
//            self.today = today
//        }
//    }
//
//    func uniteCells () ->  [UIButton]{
//        return [Cell1, Cell2, Cell3, Cell4, Cell5, Cell6, Cell7, Cell8, Cell9, Cell10, Cell11, Cell12, Cell13, Cell14, Cell15, Cell16, Cell17, Cell18, Cell19, Cell20, Cell21, Cell22, Cell23, Cell24, Cell25, Cell26, Cell27, Cell28, Cell29, Cell30, Cell31, Cell32, Cell33, Cell34, Cell35, Cell36, Cell37]
//
//    }
//
//}
//
//
//
//
//>>>>>>> origin/Denis
