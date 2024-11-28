//
//  JustDroppedViewCell.swift
//  kream
//
//  Created by 강희정 on 11/2/24.
//

import UIKit
import SnapKit
import Then

class JustDroppedViewCell: UICollectionViewCell {
    static let identifier = "JustDroppedViewCell"
    
    public lazy var imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 8
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var saveButton = UIButton().then {
        let image = UIImage(named: "ic_save")
        $0.setImage(image, for: .normal)
        $0.tintColor = .black
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(setBtnTap), for: .touchUpInside)
    }
    
    @objc
    func setBtnTap() {
        let currentImage = saveButton.image(for: .normal)
        
        if currentImage == UIImage(named: "ic_save") {
            saveButton.setImage(UIImage(named: "ic_save_fill"), for: .normal)
        } else {
            saveButton.setImage(UIImage(named: "ic_save"), for: .normal)
        }
    }
    
    public lazy var transactionLabel = UILabel().then {
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 10)
        $0.textAlignment = .right
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var brandNameLabel = UILabel().then {
        $0.textColor = .black
        $0.textAlignment = .left
        $0.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var productNameLabel = UILabel().then {
        
        $0.textAlignment = .left
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    public lazy var productPriceLabel = UILabel().then {
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        $0.textAlignment = .left
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var priceSubLabel = UILabel().then {
        $0.textColor = .systemGray3
        $0.text = "즉시 구매가"
        $0.font = UIFont.systemFont(ofSize: 10)
        $0.textAlignment = .left
        $0.translatesAutoresizingMaskIntoConstraints = false
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
        addSubview(saveButton)
        addSubview(transactionLabel)
        addSubview(brandNameLabel)
        addSubview(productNameLabel)
        addSubview(productPriceLabel)
        addSubview(priceSubLabel)
        
        imageView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.width.equalTo(142)
            
        }
        
        saveButton.snp.makeConstraints {
            $0.bottom.equalTo(imageView.snp.bottom).offset(-10)
            $0.right.equalTo(imageView.snp.right).offset(-10)
            $0.height.equalTo(22)
            $0.width.equalTo(20)
        }
        
        transactionLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.top).offset(8)
            $0.right.equalTo(imageView.snp.right).offset(-8)
        }
        
        brandNameLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(8)
            $0.left.equalTo(imageView.snp.left).offset(4)
        }
        
        productNameLabel.snp.makeConstraints {
            $0.top.equalTo(brandNameLabel.snp.bottom).offset(3)
            $0.left.equalTo(imageView.snp.left).offset(4)
        }
        
        productPriceLabel.snp.makeConstraints {
            $0.top.equalTo(productNameLabel.snp.bottom).offset(26)
            $0.left.equalTo(imageView.snp.left).offset(4)
        }
        
        priceSubLabel.snp.makeConstraints {
            $0.top.equalTo(productPriceLabel.snp.bottom).offset(2)
            $0.left.equalTo(imageView.snp.left).offset(4)
        }
    }
    
    
}
