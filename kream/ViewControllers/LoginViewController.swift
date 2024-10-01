//
//  ViewController.swift
//  UMS_kream
//
//  Created by 강희정 on 9/25/24.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = loginView
        
        loginView.loginButton.addTarget(self, action: #selector(loginbtnTap), for: .touchUpInside)
    }
    
    private lazy var loginView: LoginView = {
        let view = LoginView()

        return view
    }()
    
    @objc
    private func loginbtnTap() {
        let viewController = BaseViewController()
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
    }


}

