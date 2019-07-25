//
//  AccountViewController.swift
//  TesteiOSv2
//
//  Created by Vitor Ferraz Varela on 22/07/19.
//  Copyright © 2019 Vitor Ferraz Varela. All rights reserved.
//

import UIKit

protocol AccountDataPassing {
    var dataStore: AccountDataStore? { get }
}

protocol AccountDisplayLogic: class {
    func displayAccountDetails(viewModel: AccountViewModel)
    func displayStatements(list: [StatementViewModel])
    func presentError(error: Error)

}

final class AccountViewController: UIViewController {
    
    @IBOutlet weak var lbBalance: UILabel!
    @IBOutlet weak var lbAccount: UILabel!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var tableView: UITableView!

    var lbState: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor(named: "main")
        return label
    }()
    var interactor: AccountBusinessLogic?
    var router: (NSObjectProtocol & AccountRoutingLogic & AccountDataPassing)?
    var dataStore: AccountDataStore?
    var viewModel: AccountViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.stateChange = {
            self.lbState.text = self.viewModel?.currentState.rawValue
        }

        configureTableView()
       
        guard let viewModel = viewModel else {return}
        displayAccountDetails(viewModel: viewModel)
    }
    
     func configureTableView() {
        tableView.dataSource = self
        tableView.separatorInset = .zero
        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableView.automaticDimension
        tableView.refreshControlHandler { [weak self] _ in
            guard let self = self else { return }
            self.fetchStatements()
        }
     }
     func setup() {
        let viewController = self
        let interactor = AccountInteractor()
        let presenter = AccountPresenter()
        let router = AccountRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        dataStore = interactor
    }
    @IBAction func btLogoutTapped(_ sender: Any) {
        router?.routeToLogin()
    }
    
    func fetchStatements() {
        interactor?.fetchStatements()
        viewModel?.currentState = .loading
    }
    

    func updateUI() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.refreshControl?.endRefreshing()
            self?.tableView.reloadData()
            UIView.animate(withDuration: 0.5) {
                self?.tableView.alpha = 1.0
            }
        }
    }

}

extension AccountViewController: AccountDisplayLogic {
    func presentError(error: Error) {
        tableView.refreshControl?.endRefreshing()
        showAlert(title: "Ops...", message: error.localizedDescription) {}
    }
    
    func displayAccountDetails(viewModel: AccountViewModel) {
        lbName.text = viewModel.name
        lbAccount.text = viewModel.account
        lbBalance.text = viewModel.balance
        fetchStatements()
    }
    
    func displayStatements(list: [StatementViewModel]) {
        dump(list)
        viewModel?.list = list
        updateUI()
    }
}
extension AccountViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.backgroundView =  viewModel?.currentState == .loaded ? nil : lbState

        return viewModel?.list.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: StatementTableViewCell.self), for: indexPath) as? StatementTableViewCell else {
            fatalError()
        }
        guard let cellViewModel = self.viewModel?.list[indexPath.row] else { return UITableViewCell() }

        cell.prepare(viewModel: cellViewModel)
        return cell
    }
}
