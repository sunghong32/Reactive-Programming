//
//  StockDetailUseCase.swift
//  StockTutorial
//
//  Created by 민성홍 on 2021/07/22.
//

import Combine

class StockDetailUseCase {
    func fetchTimeSeriesPublisher(keywords: String) -> AnyPublisher<TimeSeriesMonthlyAdjusted, Error> {
        return stockRepository.fetchTimeSeriesPublisher(keywords: keywords)
    }

    private let stockRepository: StockRepository

    init(stockRepository: StockRepository) {
        self.stockRepository = stockRepository
    }
}
