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

    let useCase: StockDetailUseCase

    func viewDidLoad(symbol: String) {
        useCase.fetchTimeSeriesPublisher(keywords: symbol).sink { completion in
            switch completion {
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            case .finished: break
            }
        } receiveValue: { value in
            self.timeSeriesMonthlyAdjusted = value
        }.store(in: &subscriber)

    }

    init(useCase: StockDetailUseCase) {
        self.useCase = useCase
        super.init()
    }
}
