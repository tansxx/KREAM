//
//  SearchViewController.swift
//  kream
//
//  Created by 강희정 on 10/14/24.
//

import UIKit

class SearchViewController: UIViewController {
    
    let searchView = SearchView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view = searchView
        
        let backButton = UIBarButtonItem(image: UIImage(named: "ic_back"), style: .plain, target: self, action: #selector(backbtntap))
            backButton.tintColor = .black
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func backbtntap() {
        
        navigationController?.popViewController(animated: true)
    }


}
