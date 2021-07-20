//
//  Coordinator.swift
//  StockTutorial
//
//  Created by 민성홍 on 2021/07/20.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController? { get set }
    func start()
}

