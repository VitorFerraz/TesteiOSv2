//
//  LoginViewController.swift
//  TesteiOSv2
//
//  Created by Vitor Ferraz Varela on 22/07/19.
//  Copyright © 2019 Vitor Ferraz Varela. All rights reserved.
//

import UIKit


protocol LoginDisplayLogic: class {
    func displayError(viewModel: LoginViewModel)
    func displayUserAccount()
    func displayPersistedCredentials(viewModel: LoginViewModel)
}


final class LoginViewController: UIViewController {

    @IBOutlet weak var btLogin: UIButton!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfLogin: UITextField!
    
    var interactor: LoginBusinessLogic?
    var router: (NSObjectProtocol & LoginRoutingLogic & LoginDataPassing)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getPersistedCredentials()
    }
    
    private func setup() {
        let viewController = self
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let router = LoginRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        getPersistedCredentials()
    }
    
    @IBAction func performLoginTapped(_ sender: UIButton) {
    
        let request = Login(user: tfLogin.text, password: tfPassword.text)
        interactor?.submitLogin(request: request)
        startLoading()
    }
    
    func getPersistedCredentials() {
        interactor?.getPersistedCredentials()
    }
    
    func startLoading() {
        view.isUserInteractionEnabled = false
        btLogin.startLoading()
    }
    
    func stopLoading() {
        view.isUserInteractionEnabled = true
        btLogin.stopLoading()
    }

}

extension LoginViewController: LoginDisplayLogic {
    func displayUserAccount() {
        DispatchQueue.main.async {
            self.stopLoading()
            self.router?.routeToAccount()
        }
    }
    
    
    func displayError(viewModel: LoginViewModel) {
        DispatchQueue.main.async {
            self.stopLoading()
            self.showAlert(title: "Ops...", message: viewModel.errorMessage ?? "", okButton: { [weak self] in
                if viewModel.activateUserTextField {
                    self?.tfLogin.becomeFirstResponder()
                } else if viewModel.activatePasswordTextField {
                    self?.tfPassword.becomeFirstResponder()
                }
            })
        }
    }
    
    func displayPersistedCredentials(viewModel: LoginViewModel) {
        DispatchQueue.main.async {
            self.tfLogin.text = viewModel.user
            self.tfPassword.text = viewModel.password
        }
    }
    
    
}
