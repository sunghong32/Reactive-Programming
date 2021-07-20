//
//  BaseView.swift
//  StockTutorial
//
//  Created by 민성홍 on 2021/07/20.
//

import UIKit

class BaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)

        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureUI() {
        backgroundColor = .systemBackground
    }
}
