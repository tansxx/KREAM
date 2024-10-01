//
//  ProfileManageViewController.swift
//  kream
//
//  Created by 강희정 on 10/1/24.
//

import UIKit

class ProfileManageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = profileManageView
        
        let backButton = UIBarButtonItem(image: UIImage(named: "ic_back"), style: .plain, target: self, action: #selector(backbtntap))
            backButton.tintColor = .black
        
        self.navigationItem.leftBarButtonItem = backButton

    }
    
    @objc func backbtntap() {
        
        navigationController?.popViewController(animated: true)
    }
    
    private lazy var profileManageView: ProfileManageView = {
        let view = ProfileManageView()
        
        return view
    }()
    

}
