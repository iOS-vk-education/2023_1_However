//
//  TabBarController.swift
//  Odnako
//
//  Created by User on 16.11.2023.
//

import UIKit

final class TabBarController : UITabBarController{
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        let settingsViewController = SettingsViewController()
        let settingsBarItem = UITabBarItem()
        settingsBarItem.title = "Настройки"
        settingsBarItem.image = UIImage(systemName: "person")
        settingsViewController.tabBarItem = settingsBarItem
        
        let mainViewController = MainViewController()
        let mainBarItem = UITabBarItem()
        mainBarItem.title = "Настройки"
        mainBarItem.image = UIImage(systemName: "person")
        mainViewController.tabBarItem = mainBarItem
        
        
        let calendarViewController = CalendarViewController()
        let calendarBarItem = UITabBarItem()
        calendarBarItem.title = "Настройки"
        calendarBarItem.image = UIImage(systemName: "person")
        calendarViewController.tabBarItem = calendarBarItem
        
        viewControllers = [
            settingsViewController,
            mainViewController,
            calendarViewController
        ]
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
       
    }
}
