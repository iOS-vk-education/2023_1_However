//
//  CalendarPresenter.swift
//  Odnako
//
//  Created by User on 27.12.2023.
//

import Foundation

protocol CalendarOutput: AnyObject {
    
    /// Сообщает, что была нажата кнопка добавления дедлайн.
    func showAddDeadlineViewController(_ vc: addDeadLineViewController)
    
}
