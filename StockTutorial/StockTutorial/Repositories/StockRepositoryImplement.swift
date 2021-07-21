//
//  StockRepositoryImplement.swift
//  StockTutorial
//
//  Created by 민성홍 on 2021/07/20.
//
import Combine
import Foundation

class StockRepositoryImplement: StockRepository {
    let apiKey: String = "H7EIQM981K7PGHAQ"
    let decoder = JSONDecoder()

    func fetchStocksPublisher(keywords: String) -> AnyPublisher<StockResult, Error> {
        let urlString = "https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=\(keywords)&apikey=\(apiKey)"
        guard let url = URL(string: urlString) else {
            let error = URLError(.badURL)

            return Fail(error: error).eraseToAnyPublisher()
        }

        return URLSession.shared.dataTaskPublisher(for: url).map { $0.data }.decode(type: StockResult.self, decoder: decoder).receive(on: RunLoop.main).eraseToAnyPublisher()
    }
}
