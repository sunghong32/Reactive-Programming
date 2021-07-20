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
    var loading: BehaviorSubject<Bool> = .init(value: false)
    var errorMessage: BehaviorSubject<String?> = .init(value: nil)
    var stocks: BehaviorSubject<[Stock]> = .init(value: [])
    var subscriber: Set<AnyCancellable> = .init()
    
    let useCase: StockUseCase

    init(useCase: StockUseCase) {
        self.useCase = useCase
    }

    func viewDidLoad() {
        loading.onNext(true)
        useCase.fetchStocksPublisher(keywords: "AMZ").sink { completion in
            self.loading.onNext(false)
            switch completion {
            case .failure(let error):
                self.errorMessage.onNext(error.localizedDescription)
            case .finished: break
            }
        } receiveValue: { stockResult in
            self.loading.onNext(false)
            self.stocks.onNext(stockResult.items)
        }.store(in: &subscriber)
    }
}
