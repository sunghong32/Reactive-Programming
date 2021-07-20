//
//  MainController.swift
//  StockTutorial
//
//  Created by 민성홍 on 2021/07/20.
//

import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController?

    func start() {
        let rootViewController = StockListController()
        navigationController?.setViewControllers([rootViewController], animated: false)
    }
}
