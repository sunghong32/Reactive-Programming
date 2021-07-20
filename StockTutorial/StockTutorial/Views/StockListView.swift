//
//  StockListView.swift
//  StockTutorial
//
//  Created by 민성홍 on 2021/07/20.
//

import UIKit

class StockListView: BaseView {
    let tableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = .systemBackground
        return view
    }()

    let searchViewController: UISearchController = {
        let view = UISearchController(searchResultsController: nil)
        view.searchBar.placeholder = "Enter a company name or symbol"
        view.obscuresBackgroundDuringPresentation = false
        return view
    }()

    override func configureUI() {
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
