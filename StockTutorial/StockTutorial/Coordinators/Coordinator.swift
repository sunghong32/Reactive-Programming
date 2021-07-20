//
//  Coordinator.swift
//  StockTutorial
//
//  Created by 민성홍 on 2021/07/20.
//

import UIKit

class Coordinator {
    func start(window: UIWindow, rootViewController: UIViewController) {
        let rootViewController = UINavigationController(rootViewController: rootViewController)
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
}

