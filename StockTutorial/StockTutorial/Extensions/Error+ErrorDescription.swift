//
//  Error+ErrorDescription.swift
//  StockTutorial
//
//  Created by 민성홍 on 2021/07/22.
//

import Foundation

public enum MyError: Error {
    case badResponse
    case badURL
    case enconding
}

extension MyError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .badResponse:
            return "네트워크 상태가 좋지 않습니다."
        case .badURL:
            return "유효하지 않은 URL입니다."
        case .enconding:
            return "인코딩에 실패하였습니다."
        }
    }
}
