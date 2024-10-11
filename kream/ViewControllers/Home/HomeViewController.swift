//
//  HomeViewController.swift
//  kream
//
//  Created by 강희정 on 9/30/24.
//

import UIKit
import SnapKit
import Then

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = homeView
        setSearchBar()
    }
    
    private lazy var homeView: HomeView = {
        let view = HomeView()

        return view
    }()
    
    
    
    // 검색창
    func setSearchBar() {
        let searchBar = UISearchBar()
        searchBar.backgroundImage = UIImage()

        self.view.addSubview(searchBar)
        
        if let textField = searchBar.value(forKey: "searchField") as? UITextField {
            textField.backgroundColor = UIColor.systemGray6
            textField.attributedPlaceholder = NSAttributedString(string: "브랜드, 상품, 프로필 태그 등", attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.lightGray,
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13.5)
            ])
            textField.textColor = UIColor.black
            textField.leftViewMode = .never
            textField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 8.0, height: 0.0))
            textField.leftViewMode = .always
        }
        
        searchBar.snp.makeConstraints {
            $0.top.equalToSuperview().offset(51)
            $0.left.equalToSuperview().offset(16)
            $0.right.equalToSuperview().offset(-55) // 오른쪽 여백 추가
            $0.height.equalTo(40)
        }
    }
    
    
}


