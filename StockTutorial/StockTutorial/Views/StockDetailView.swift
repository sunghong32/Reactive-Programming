//
//  StockDetailView.swift
//  StockTutorial
//
//  Created by 민성홍 on 2021/07/21.
//

import UIKit

class StockDetailView: BaseView {
    let scrollView = UIScrollView()
    let titleLabel = TitleLabel()
    let subTitleLabel = NormalGrayLabel()
    let currentValueTextLabel = SmallLabel()
    let currentValueLabel = TitleLabel()
    let investmentLabel = SmallLabel()
    let investmentValueLabel = SmallBoldLabel()
    let gainLabel = SmallLabel()
    let gainValueLabel = SmallBoldLabel()
    let annualReturnLabel = SmallLabel()
    let annualReturnValueLabel = SmallBoldLabel()

    override func configureUI() {
        titleLabel.text = "SPY"
        subTitleLabel.text = "S&P 500 ETF"
        currentValueTextLabel.text = "Curren Value (USD)"
        currentValueLabel.text = "5000"
        investmentLabel.text = "Investment amount"
        investmentValueLabel.text = "USD 100"
        gainLabel.text = "Gain"
        gainValueLabel.text = "+100.25 (+10.25%)"
        annualReturnLabel.text = "Annual Return"
        annualReturnValueLabel.text = "10.5%"

        addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true

        addSubview(subTitleLabel)
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.leftAnchor.constraint(equalTo: titleLabel.rightAnchor, constant: 10).isActive = true
        subTitleLabel.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true

        addSubview(currentValueTextLabel)
        currentValueTextLabel.translatesAutoresizingMaskIntoConstraints = false
        currentValueTextLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 10).isActive = true
        currentValueTextLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true

        addSubview(currentValueLabel)
        currentValueLabel.translatesAutoresizingMaskIntoConstraints = false
        currentValueLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        currentValueLabel.topAnchor.constraint(equalTo: currentValueTextLabel.bottomAnchor, constant: 10).isActive = true

        addSubview(investmentLabel)
        investmentLabel.translatesAutoresizingMaskIntoConstraints = false
        investmentLabel.topAnchor.constraint(equalTo: currentValueLabel.bottomAnchor, constant: 16).isActive = true
        investmentLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true

        addSubview(investmentValueLabel)
        investmentValueLabel.translatesAutoresizingMaskIntoConstraints = false
        investmentValueLabel.centerYAnchor.constraint(equalTo: investmentLabel.centerYAnchor).isActive = true
        investmentValueLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true

        addSubview(gainLabel)
        gainLabel.translatesAutoresizingMaskIntoConstraints = false
        gainLabel.topAnchor.constraint(equalTo: investmentValueLabel.bottomAnchor, constant: 10).isActive = true
        gainLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true

        addSubview(gainValueLabel)
        gainValueLabel.translatesAutoresizingMaskIntoConstraints = false
        gainValueLabel.centerYAnchor.constraint(equalTo: gainLabel.centerYAnchor).isActive = true
        gainValueLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true

        addSubview(annualReturnLabel)
        annualReturnLabel.translatesAutoresizingMaskIntoConstraints = false
        annualReturnLabel.topAnchor.constraint(equalTo: gainValueLabel.bottomAnchor, constant: 10).isActive = true
        annualReturnLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true

        addSubview(annualReturnValueLabel)
        annualReturnValueLabel.translatesAutoresizingMaskIntoConstraints = false
        annualReturnValueLabel.centerYAnchor.constraint(equalTo: annualReturnLabel.centerYAnchor).isActive = true
        annualReturnValueLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
    }
}
