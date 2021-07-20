//
//  StockListViewModel.swift
//  StockTutorial
//
//  Created by 민성홍 on 2021/07/20.
//
import RxCocoa
import RxSwift
import Combine

class StockListViewModel {
    @Published var stocks: [Stock] = []
    @Published var errorMessage: String?
    @Published var loading = false

    var subscriber: Set<AnyCancellable> = .init()
    let useCase: StockUseCase

    func searchQueryChanged(query: String) {
        loading = true
        useCase.fetchStocksPublisher(keywords: query).sink { [unowned self] completino in
            self.loading = false
            switch completino {
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            case .finished: break
            }
        } receiveValue: { [unowned self] stockResult in
            self.stocks = stockResult.items
        }.store(in: &subscriber)

    }

    init(useCase: StockUseCase) {
        self.useCase = useCase
    }
}

