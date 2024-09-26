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
    }
    
    private lazy var loginView: LoginView = {
        let view = LoginView()
        
        return view
    }()


}

