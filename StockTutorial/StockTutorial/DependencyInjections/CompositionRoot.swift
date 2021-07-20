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
        let stockRepository: StockRepository = StockRepositoryImplement()

        let stockListControllerFactory: () -> StockListController = {
            let useCase = StockUseCase(stockRepository: stockRepository)
            let viewModel = StockListViewModel(useCase: useCase)
            return .init(dependency: .init(viewModel: viewModel))
        }

        let mainCoordinator: MainCoordinator = .init(dependency: .init(stockListControllerFactory: stockListControllerFactory))

        return .init(mainCoordinator: mainCoordinator)
    }
}
