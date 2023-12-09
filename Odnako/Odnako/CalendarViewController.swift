//
//  CalendarViewController.swift
//  Odnako
//
//  Created by User on 20.11.2023.
//

import UIKit

class CalendarViewController: UIViewController {
    private let year = UIButton()
    private let month = UIButton()
    private let calendar = UIButton()
    private let selectMonthYaer = UILabel()
    //private let collectionCellsOfCalendar = UICollectionView()
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setYear()
        setMonth()
        
        year.titleLabel?.text = "2023"
        
        month.titleLabel?.text = "Декабрь"
        
        selectMonthYaer.text = "   \(year.currentTitle!) \(month.currentTitle!)"
        
        calendar.setTitle("", for: .normal)
        calendar.setTitleColor( .black, for: .normal)
        calendar.setTitleColor( .white, for: .highlighted)
        
        
        view.addSubview(year)
        view.addSubview(month)
        view.addSubview(calendar)
        calendar.addSubview(selectMonthYaer)
        
        let widthOfCellsCalendar = Int((view.frame.width - 20) * 0.1)
        let distanceBetweenObjects = Int((view.frame.width - 20 - CGFloat(7 * widthOfCellsCalendar)) * 0.125)
        
        let ButtomCellOfCalendar = UIButton()
        
        for row in 1...5{
            for colums in 1...7{
                calendar.addSubview(ButtomCellOfCalendar)
            }
        }
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        year.backgroundColor = .purple
        year.translatesAutoresizingMaskIntoConstraints = false
        year.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        year.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        year.rightAnchor.constraint(equalTo: view.centerXAnchor, constant: -10).isActive = true
        year.layer.borderColor = UIColor.black.cgColor
        year.layer.borderWidth = 2
        year.layer.cornerRadius = year.frame.height/2
        
        month.translatesAutoresizingMaskIntoConstraints = false
        month.backgroundColor = .purple
        month.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        month.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: 10).isActive = true
        month.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        month.layer.borderColor = UIColor.black.cgColor
        month.layer.borderWidth = 2
        month.layer.cornerRadius = year.frame.height/2
        
        
        calendar.backgroundColor = .purple
        calendar.layer.cornerRadius = 10
        calendar.translatesAutoresizingMaskIntoConstraints = false
        calendar.topAnchor.constraint(equalTo: month.bottomAnchor, constant: 20).isActive = true
        calendar.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        calendar.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        calendar.layer.borderColor = UIColor.black.cgColor
        calendar.layer.borderWidth = 2
        calendar.bottomAnchor.constraint(equalTo: month.bottomAnchor, constant: 200).isActive = true
        
        
        selectMonthYaer.backgroundColor = .purple
        selectMonthYaer.layer.cornerRadius = 10
        selectMonthYaer.translatesAutoresizingMaskIntoConstraints = false
        selectMonthYaer.topAnchor.constraint(equalTo: calendar.topAnchor, constant: 5).isActive = true
        selectMonthYaer.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        selectMonthYaer.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        //selectMonthYaer.textAlignment = .center
        /*
        collectionCellsOfCalendar.topAnchor.constraint(equalTo: selectMonthYaer.bottomAnchor,constant: 5).isActive = true
        collectionCellsOfCalendar.leftAnchor.constraint(equalTo: selectMonthYaer.leftAnchor,constant: 5).isActive = true
        collectionCellsOfCalendar.rightAnchor.constraint(equalTo: selectMonthYaer.rightAnchor,constant: 5).isActive = true
        collectionCellsOfCalendar.backgroundColor = .blue
         */
    }
    
    
    
    func setYear(){
        let optionClosure = {(action : UIAction) in print(action.title)}
        year.menu = UIMenu(children : [
            UIAction(title:"2015",  handler: optionClosure),
            UIAction(title:"2016",  handler: optionClosure),
            UIAction(title:"2017",  handler: optionClosure),
            UIAction(title:"2018",  handler: optionClosure),
            UIAction(title:"2019",  handler: optionClosure),
            UIAction(title:"2020",  handler: optionClosure),
            UIAction(title:"2021",  handler: optionClosure),
            UIAction(title:"2022",  handler: optionClosure),
            UIAction(title:"2023",  handler: optionClosure),
            UIAction(title:"2024",  handler: optionClosure),
            UIAction(title:"2025",  handler: optionClosure)
        ])
        
            
        year.showsMenuAsPrimaryAction = true
        year.changesSelectionAsPrimaryAction = true
    }
    
    
    func setMonth(){
        let optionClosure = {(action : UIAction) in print (action.title)}
        month.menu = UIMenu(children : [
            UIAction(title:"Январь",   handler: optionClosure),
            UIAction(title:"Февраль",  handler: optionClosure),
            UIAction(title:"Март",  handler: optionClosure),
            UIAction(title:"Апрель",  handler: optionClosure),
            UIAction(title:"Май",  handler: optionClosure),
            UIAction(title:"Июнь",  handler: optionClosure),
            UIAction(title:"Июль",  handler: optionClosure),
            UIAction(title:"Август",  handler: optionClosure),
            UIAction(title:"Сентябрь",  handler: optionClosure),
            UIAction(title:"Октябрь",  handler: optionClosure),
            UIAction(title:"Ноябрь", handler: optionClosure),
            UIAction(title:"Декабрь",  handler: optionClosure)
            ])
            
        
        month.showsMenuAsPrimaryAction = true
        month.changesSelectionAsPrimaryAction = true
    }
    
    
    
}
