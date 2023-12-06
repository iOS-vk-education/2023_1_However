//
//  MainPresenter.swift
//  Odnako
//
//  Created by Anton Timonin on 06.12.2023.
//

import Foundation

protocol MainPresenterOutput: AnyObject {
    
    func viewDidLoad()
    
    /// Сообщает, что была нажата кнопка добавления дедлайн.
    func addDeadlineButtonDidTapped()
    
    func addButtonFilterDidTapped()
}

class MainPresenter: MainPresenterOutput {
    
    weak var viewInput: MainViewInput?
    
    init() { }
    
    func addDeadlineButtonDidTapped() {
        print("addDeadlineButtonDidTapped")
        self.viewInput?.addModule(addDeadLineViewController())
    }
    
    func addButtonFilterDidTapped() {
        print("addDeadlineButtonDidTapped")
    }
    
    func viewDidLoad() {
        print("Стартуем загрузку из сети")
    }
}