//
//  StockListViewController.swift
//  StockTutorial
//
//  Created by 민성홍 on 2021/07/20.
//

import UIKit
import Pure

class StockListController: BaseViewController, FactoryModule {

    struct Dependency {
        let viewModel: StockListViewModel
    }

    let selfView = StockListView()
    let viewModel: StockListViewModel

    required init(dependency: Dependency, payload: ()) {
        viewModel = dependency.viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        viewModel.viewDidLoad()
    }

    override func configureUI() {
        view.addSubview(selfView)
        selfView.translatesAutoresizingMaskIntoConstraints = false
        selfView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        selfView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        selfView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        selfView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        selfView.searchViewController.delegate = self
        selfView.searchViewController.searchResultsUpdater = self

        navigationItem.searchController = selfView.searchViewController
    }

    func bind() {
        viewModel.loading
            .subscribe(onNext: { loading in
                print("loading: \(loading)")
            })
            .disposed(by: disposeBag)

        viewModel.errorMessage
            .subscribe(onNext: { error in
                guard let error = error else { return }
                print("error: \(error)")
            })
            .disposed(by: disposeBag)

        viewModel.stocks
            .subscribe(onNext: { stocks in
                print("stocks: \(stocks)")
            })
            .disposed(by: disposeBag)
    }
}

extension StockListController: UISearchControllerDelegate {

}

extension StockListController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {

    }
}
