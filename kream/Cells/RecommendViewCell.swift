//
//  RecommendViewCell.swift
//  kream
//
//  Created by 강희정 on 10/11/24.
//

import UIKit
import SnapKit
import Then

class recommendViewCell: UICollectionViewCell {
    static let identifier = "recommendViewCell"
    
    private lazy var imageView = UIImageView().then {
        $0.clipsToBounds = true
    }
    
    private lazy var titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 11, weight: .light)
        $0.textColor = .black
        $0.text = "category"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(imageView)
        addSubview(titleLabel)
        
        imageView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.width.equalTo(61)
        }
        
        titleLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
    }
}
