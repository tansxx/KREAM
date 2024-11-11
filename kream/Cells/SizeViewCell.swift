//
//  SizeViewCell.swift
//  kream
//
//  Created by 강희정 on 11/5/24.
//

import UIKit
import SnapKit

class SizeViewCell: UICollectionViewCell {
    static let identifier = "SizeViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
//    private lazy var sizeButton = UIButton().then {
//        $0.clipsToBounds = true
//        $0.layer.cornerRadius = 10
//        $0.layer.borderWidth = 1
//        $0.layer.borderColor = UIColor.F_3_F_3_F_3.cgColor
//        // $0.addTarget(self, action: #selector(sizeButtonTapped), for: .touchUpInside)
//    }
    
    
    private lazy var sizeView = UIView().then {
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
        $0.layer.borderColor = UIColor.F_3_F_3_F_3.cgColor
        $0.layer.borderWidth = 1
    }
    
    public lazy var sizeLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textColor = .black
        $0.textAlignment = .center
    }
    
    public lazy var priceLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.textColor = .D_95_A_5_D
        $0.textAlignment = .center
    }
    
    private func setupView() {
        addSubview(sizeView)
        sizeView.addSubview(sizeLabel)
        sizeView.addSubview(priceLabel)
        
        sizeView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalTo(47)
            $0.width.equalTo(110)
        }
        
        sizeLabel.snp.makeConstraints {
            $0.top.equalTo(sizeView.snp.top).offset(8)
            $0.centerX.equalTo(sizeView)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(sizeLabel.snp.bottom)
            $0.centerX.equalTo(sizeView)
        }
    }
    
//    // 사이즈 버튼 클릭 시 상태 변경
//    @objc private func sizeButtonTapped() {
//        if sizeButton.layer.borderColor == UIColor.F_3_F_3_F_3.cgColor {
//            sizeButton.layer.borderColor = UIColor.black.cgColor
//        } else {
//            sizeButton.layer.borderColor = UIColor.F_3_F_3_F_3.cgColor
//        }
//    }
//    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                sizeView.layer.borderColor = UIColor.black.cgColor
                sizeLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
                priceLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
            } else {
                sizeView.layer.borderColor = UIColor.F_3_F_3_F_3.cgColor
                sizeLabel.font = UIFont.systemFont(ofSize: 14)
                priceLabel.font = UIFont.systemFont(ofSize: 12)
            }
        }
    }
}
