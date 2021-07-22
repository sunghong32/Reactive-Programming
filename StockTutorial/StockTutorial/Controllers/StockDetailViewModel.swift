//
//  StockDetailViewModel.swift
//  StockTutorial
//
//  Created by 민성홍 on 2021/07/22.
//

import Combine

class StockDetailViewModel: BaseViewModel {
    @Published var loading = false
    @Published var errorMessage: String?
    @Published var timeSeriesMonthlyAdjusted: TimeSeriesMonthlyAdjusted?
    @Published var stock: Stock?

    let useCase: StockDetailUseCase

    func viewDidLoad(symbol: String, stock: Stock) {
        self.stock = stock
        loading = true
        useCase.fetchTimeSeriesPublisher(keywords: symbol).sink { completion in
            self.loading = false

            switch completion {
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            case .finished: break
            }
        } receiveValue: { value in
            var timeSeriesMonthlyAdjusted = value
            timeSeriesMonthlyAdjusted.generateMonthInfos()
            self.timeSeriesMonthlyAdjusted = timeSeriesMonthlyAdjusted
        }.store(in: &subscriber)

    }

    init(useCase: StockDetailUseCase) {
        self.useCase = useCase
        super.init()
    }
}
