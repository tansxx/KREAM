//
//  SearchView.swift
//  kream
//
//  Created by 강희정 on 10/14/24.
//

import UIKit
import Then
import SnapKit

class SearchView: UIView {

    let titleLabel = UILabel().then{
        $0.text = "Search"
        $0.textColor = .black
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addComponents(){
        addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints{
            $0.center.equalToSuperview()
        }
    }
    
}
