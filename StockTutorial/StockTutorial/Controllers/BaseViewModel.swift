//
//  BaseViewModel.swift
//  StockTutorial
//
//  Created by 민성홍 on 2021/07/22.
//

import Combine

class BaseViewModel {
    var subscriber: Set<AnyCancellable> = .init()

    init() {
        subscriber = .init()
    }
}
