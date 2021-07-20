//
//  StockRepository.swift
//  StockTutorial
//
//  Created by 민성홍 on 2021/07/20.
//
import Combine

protocol StockRepository {
    func fetchStocksPublisher(keywords: String) -> AnyPublisher<StockResult, Error>
}
