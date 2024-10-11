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
        guard let email = loginView.idTextField.text, !email.isEmpty,
              let pwd = loginView.pwdTextField.text, !pwd.isEmpty else {
            return
        }
        
        // 이메일과 비밀번호를 UserDefaults에 저장
        UserDefaults.standard.set(email, forKey: "userEmail")
        UserDefaults.standard.set(pwd, forKey: "userPwd")
        
        let viewController = BaseViewController()
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
    }
    

}

