//
//  StockDetailController.swift
//  StockTutorial
//
//  Created by 민성홍 on 2021/07/21.
//

import UIKit
import Pure

class StockDetailController: BaseViewController, FactoryModule {
    struct Dependency {
        let stock: Stock
    }

    let stock: Stock

    required init(dependency: Dependency, payload: ()) {
        stock = dependency.stock
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureUI() {
        view.backgroundColor = .systemBackground
        title = "Detail"
    }
}
