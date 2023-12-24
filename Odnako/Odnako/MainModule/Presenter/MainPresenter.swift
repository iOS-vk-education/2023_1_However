//
//  MainPresenter.swift
//  Odnako
//
//  Created by Anton Timonin on 06.12.2023.
//

import Foundation
import UIKit

protocol MainPresenterOutput: AnyObject {
    
    func viewDidLoad()
    
    /// Сообщает, что была нажата кнопка добавления дедлайн.
    func addDeadlineButtonDidTapped()
    
    func addButtonFilterDidTapped(_ vc: UITableView)
    
    func getUserDeadlines(collection: String, UserID: String)
}

class MainPresenter: MainPresenterOutput {
    
    weak var viewInput: MainViewInput?
    
    init() { }
    
    func addDeadlineButtonDidTapped() {
        print("addDeadlineButtonDidTapped")
        // build addDeadLineViewController
        self.viewInput?.addModule(addDeadLineViewController())
    }
    
    func addButtonFilterDidTapped(_ vc: UITableView) {
        print("addButtonFilterDidTapped")
        self.viewInput?.showDropdownFilterMenu(vc)
    }
    
    func getUserDeadlines(collection: String, UserID: String){
        APIManager.shared.getUserDeadlines(collection: collection, userID: UserID) { deadlines, error in
            if let error = error {
                // Обрабатываем ошибку, если она произошла
                print("Error fetching deadlines: \(error.localizedDescription)")
            } else if let deadlines = deadlines {
                // Используем полученные дедлайны
                self.viewInput?.addDeadlines(deadlines: deadlines)
                }
            }
        }
    
    func viewDidLoad() {
        
        print("Стартуем загрузку из сети")
    }
}
