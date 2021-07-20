//
//  CompositionRoot.swift
//  StockTutorial
//
//  Created by 민성홍 on 2021/07/20.
//

struct AppDependency {
    let mainCoordinator: MainCoordinator
}

extension AppDependency {
    static func resolve() -> AppDependency {
        let mainCoordinator: MainCoordinator = .init()

        return .init(mainCoordinator: mainCoordinator)
    }
}
