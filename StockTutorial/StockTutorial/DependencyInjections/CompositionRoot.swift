//
//  CompositionRoot.swift
//  StockTutorial
//
//  Created by 민성홍 on 2021/07/20.
//

struct AppDependency {
    let coordinator: Coordinator
}

extension AppDependency {
    static func resolve() -> AppDependency {
        let coordinator: Coordinator = .init()

        return .init(coordinator: coordinator)
    }
}
