//
//  SearchDetailView.swift
//  kream
//
//  Created by 강희정 on 11/25/24.
//

import UIKit
import SnapKit
import Then

class SearchDetailView: UIView {
    
    public lazy var backButton = UIButton().then {
        var configuration = UIButton.Configuration.plain()
        
        $0.setImage(UIImage(named: "ic_back"), for: .normal)
        $0.tintColor = .black
        $0.configuration = configuration
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var searchField = UITextField().then {
        $0.backgroundColor = UIColor.systemGray6
        $0.attributedPlaceholder = NSAttributedString(string: "브랜드, 상품, 프로필 태그 등", attributes: [.foregroundColor: UIColor.systemGray])
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        $0.leftViewMode = .always
        $0.textAlignment = .left
        $0.font = UIFont.systemFont(ofSize: 13.5)
        $0.layer.cornerRadius = 12
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var cancelButton = UIButton().then {
        $0.setTitle("취소", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = .clear
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private lazy var divideLine1 = UIView().then {
        $0.backgroundColor = .systemGray5
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var searchTableView = UITableView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addComponents(){
        addSubview(backButton)
        addSubview(searchField)
        addSubview(cancelButton)
        addSubview(divideLine1)
        addSubview(searchTableView)
        
        backButton.snp.makeConstraints {
            $0.centerY.equalTo(searchField)
            $0.left.equalToSuperview().offset(15)
            $0.width.height.equalTo(24)
        }

        searchField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(52)
            $0.left.equalTo(backButton.snp.right).offset(15)
            $0.right.equalTo(cancelButton.snp.left).offset(-11)
            $0.height.equalTo(39)
        }
        
        cancelButton.snp.makeConstraints {
            $0.centerY.equalTo(searchField)
            $0.right.equalToSuperview().offset(-16)
        }
        
        divideLine1.snp.makeConstraints {
            $0.top.equalTo(searchField.snp.bottom).offset(11)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        searchTableView.snp.makeConstraints {
            $0.top.equalTo(divideLine1.snp.bottom).offset(31)
            $0.left.right.bottom.equalToSuperview() // 높이 추가
        }
    }
}
