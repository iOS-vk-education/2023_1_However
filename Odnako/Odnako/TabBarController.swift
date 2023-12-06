//
//  TabBarController.swift
//  Odnako
//
//  Created by User on 20.11.2023.
//

import UIKit

final class TabBarController : UITabBarController{
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        setUpTabs()
        self.selectedIndex = 1
        self.tabBar.backgroundColor = UIColor.customTabBarColor
        view.backgroundColor = UIColor.customTabBarColor
                 
    }
    
    func setUpTabs(){
        let settingsViewController = SettingsViewController()
        let settingsBarItem = UITabBarItem()
        settingsBarItem.title = "Настройки"
        settingsBarItem.image = UIImage(named: "settingsImageTabBarItem")
//        settingsBarItem.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
//        settingsBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 2)
        settingsViewController.tabBarItem = settingsBarItem
        
        let mainViewController = MainBuilder.build()
        let mainBarItem = UITabBarItem()
        mainBarItem.title = "Задачи"
        mainBarItem.image = UIImage(named: "tickImageTabBarItem")
//        mainBarItem.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
//        mainBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 2)
        mainViewController.tabBarItem = mainBarItem
        
        
        let calendarViewController = CalendarViewController()
        let calendarBarItem = UITabBarItem()
        calendarBarItem.title = "Календарь"
        calendarBarItem.image = UIImage(named: "calendarImageTabBarItem")
//        calendarBarItem.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
//        calendarBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 3)
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
        extendedLayoutIncludesOpaqueBars = true
        self.tabBar.isTranslucent = false
        
//        view.backgroundColor = UIColor.customTabBarColor
       
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

