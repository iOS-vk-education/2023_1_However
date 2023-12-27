//
//  MainBuilder.swift
//  Odnako
//
//  Created by Anton Timonin on 06.12.2023.
//

import UIKit

final class MainBuilder {
    
    static func build() -> MainViewController {
        let presenter = MainPresenter()
        let viewController = MainViewController(output: presenter)
        presenter.viewInput = viewController
        return viewController
    }
}
