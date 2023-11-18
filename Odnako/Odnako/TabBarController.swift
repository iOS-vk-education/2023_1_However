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
        
        setUpTabs()
         
    }
    
    func setUpTabs(){
        let settingsViewController = SettingsViewController()
        let settingsBarItem = UITabBarItem()
        settingsBarItem.title = "Настройки"
        settingsBarItem.image = UIImage(named: "settingsImageTabBarItem")
        settingsViewController.tabBarItem = settingsBarItem
        
        let mainViewController = MainViewController()
        let mainBarItem = UITabBarItem()
        mainBarItem.title = "Задачи"
        mainBarItem.image = UIImage(named: "tickImageTabBarItem")
        mainViewController.tabBarItem = mainBarItem
        
        
        let calendarViewController = CalendarViewController()
        let calendarBarItem = UITabBarItem()
        calendarBarItem.title = "Календарь"
        calendarBarItem.image = UIImage(named: "calendarImageTabBarItem")
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

//extension TabBarController: UITabBarControllerDelegate{
//    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
//        if viewController is MainViewController{
//            let navigationController = UINavigationController(rootViewController: viewController)
//            present(navigationController, animated: true)
//        }
//        return true
//    }
//}
