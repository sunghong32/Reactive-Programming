//
//  StockRepositoryImplement.swift
//  StockTutorial
//
//  Created by 민성홍 on 2021/07/20.
//
import Combine
import Foundation

class StockRepositoryImplement: StockRepository {

    let apiKey: String = "BIGEIVLKEANNRKP7"
    //7OEFMBS6NJOIHK1G
    let decoder = JSONDecoder()

    func fetchStocksPublisher(keywords: String) -> AnyPublisher<StockResult, Error> {
        let queryResult = parseQueryString(text: keywords)
        var query = ""

        switch queryResult {
        case .failure(let error):
            return Fail(error: error).eraseToAnyPublisher()
        case .success(let value):
            query = value
        }

        let urlResult = parseURL(urlString: "https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=\(query)&apikey=\(apiKey)")

        switch urlResult {
        case .failure(let error):
            return Fail(error: error).eraseToAnyPublisher()
        case .success(let url):
            return URLSession.shared.dataTaskPublisher(for: url).map { $0.data }.decode(type: StockResult.self, decoder: decoder).receive(on: RunLoop.main).eraseToAnyPublisher()
        }
    }

    func fetchTimeSeriesPublisher(keywords: String) -> AnyPublisher<TimeSeriesMonthlyAdjusted, Error> {
        let queryResult = parseQueryString(text: keywords)
        var query = ""

        switch queryResult {
        case .failure(let error):
            return Fail(error: error).eraseToAnyPublisher()
        case .success(let value):
            query = value
        }

        let urlResult = parseURL(urlString: "https://www.alphavantage.co/query?function=TIME_SERIES_MONTHLY_ADJUSTED&symbol=\(query)&apikey=\(apiKey)")

        switch urlResult {
        case .failure(let error):
            return Fail(error: error).eraseToAnyPublisher()
        case .success(let url):
            return URLSession.shared.dataTaskPublisher(for: url).map { $0.data }.decode(type: TimeSeriesMonthlyAdjusted.self, decoder: decoder).receive(on: RunLoop.main).eraseToAnyPublisher()
        }
    }

    private func parseURL(urlString: String) -> Result<URL, Error> {
        if let url = URL(string: urlString) {
            return .success(url)
        } else {
            let error: MyError = .badURL
            return .failure(error)
        }
    }

    private func parseQueryString(text: String) -> Result<String, Error> {
        if let query = text.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            return .success(query)
        } else {
            let error: MyError = .enconding
            return .failure(error)
        }
    }
}
