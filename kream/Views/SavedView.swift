//
//  SavedView.swift
//  kream
//
//  Created by 강희정 on 10/4/24.
//

import UIKit
import SnapKit
import Then

class SavedView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var title = UILabel().then {
        $0.text = "Saved"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        $0.textAlignment = .center
    }
    
    // 셀 개수에 따라 동적으로 변경되도록 구현
    public lazy var smallLabel = UILabel().then {
        $0.text = "전체 개"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        $0.textAlignment = .left
    }
    
    public lazy var tableView = UITableView().then {
        $0.register(SavedCell.self, forCellReuseIdentifier: SavedCell.identifier)
        $0.separatorStyle = .singleLine
        $0.contentInsetAdjustmentBehavior = .never
    }
    
    
    private func addComponents() {
        self.addSubview(title)
        self.addSubview(smallLabel)
        self.addSubview(tableView)
        
        title.snp.makeConstraints {
            $0.top.equalToSuperview().offset(61)
            $0.left.equalToSuperview().offset(10)
        }
        
        smallLabel.snp.makeConstraints {
            $0.top.equalTo(title.snp.bottom).offset(16)
            $0.left.equalToSuperview().offset(13)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(smallLabel.snp.bottom).offset(0)
            $0.left.right.bottom.equalToSuperview()
            $0.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
        }
    }
}
