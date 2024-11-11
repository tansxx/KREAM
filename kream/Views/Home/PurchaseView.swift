//
//  PurchaseView.swift
//  kream
//
//  Created by 강희정 on 11/5/24.
//

import UIKit
import SnapKit
import Then

class PurchaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    private lazy var purchaseLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        $0.text = "구매하기"
        $0.textColor = .black
        $0.textAlignment = .center
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var closeButton = UIButton().then {
        var configuration = UIButton.Configuration.plain()
        
        $0.setImage(UIImage(named: "close_ic"), for: .normal)
        $0.tintColor = .black
        $0.configuration = configuration
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    private lazy var purchaseSubLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        $0.text = "(가격 단위: 원)"
        $0.textColor = ._929292
        $0.textAlignment = .center
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    
    private lazy var productImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.image = UIImage(named: "main_img")
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private lazy var productNameLabel = UILabel().then {
        $0.text = "Matin Kim Logo Coating Jumper"
        $0.textColor = .black
        $0.textAlignment = .left
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private lazy var productSubNameLabel = UILabel().then {
        $0.text = "마땡킴 로고 코팅 점퍼 블랙"
        $0.textColor = ._929292
        $0.textAlignment = .left
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var sizeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.itemSize = CGSize(width: 110, height: 47)
        $0.minimumInteritemSpacing = 7
        $0.minimumLineSpacing = 8
    }).then {
        $0.register(SizeViewCell.self, forCellWithReuseIdentifier: SizeViewCell.identifier)
    }
    
    private lazy var divideLine = UIView().then {
        $0.backgroundColor = .F_3_F_3_F_3
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    class CustomPurchaseButton: UIButton {
        private let totalPriceLabel = UILabel().then {
            $0.textColor = .white
            $0.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        }
        
        private let subLabel = UILabel().then {
            $0.font = UIFont.systemFont(ofSize: 10)
        }
        
        init(totalPriceText: String, subText: String, backgroundColor: UIColor, subColor: UIColor) {
            super.init(frame: .zero)
            
            self.backgroundColor = backgroundColor
            self.layer.cornerRadius = 10
            self.clipsToBounds = true
            
            self.totalPriceLabel.text = totalPriceText
            self.subLabel.text = subText
            self.subLabel.textColor = subColor
            
            self.addSubview(totalPriceLabel)
            self.addSubview(subLabel)
            
            totalPriceLabel.snp.makeConstraints {
                $0.centerX.equalToSuperview()
                $0.top.equalToSuperview().offset(11)
            }
            
            subLabel.snp.makeConstraints {
                $0.centerX.equalToSuperview()
                $0.top.equalTo(totalPriceLabel.snp.bottom)
            }
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    private lazy var quickButton = CustomPurchaseButton(totalPriceText: "345,000", subText: "빠른배송(1-2일 소요)", backgroundColor: .EF_6254, subColor: .FFCAB_9)
    
    private lazy var simpleButton = CustomPurchaseButton(totalPriceText: "407,000", subText: "일반배송(5-7일 소요)", backgroundColor: .black, subColor: .white)
    
    private func addComponents() {
        [
            purchaseLabel, purchaseSubLabel, closeButton, productImageView, productNameLabel, productSubNameLabel, sizeCollectionView, divideLine, quickButton, simpleButton
        ].forEach {addSubview($0)}
        
        purchaseLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.centerX.equalToSuperview()
        }
        
        closeButton.snp.makeConstraints {
            $0.centerY.equalTo(purchaseLabel)
            $0.left.equalTo(purchaseLabel.snp.right).offset(124)
        }
        
        purchaseSubLabel.snp.makeConstraints {
            $0.top.equalTo(purchaseLabel.snp.bottom)
            $0.centerX.equalToSuperview()
        }
        
        productImageView.snp.makeConstraints {
            $0.top.equalTo(purchaseSubLabel).offset(11)
            $0.left.equalToSuperview().offset(16)
            $0.width.height.equalTo(91)
        }
        
        productNameLabel.snp.makeConstraints {
            $0.top.equalTo(purchaseSubLabel.snp.bottom).offset(29)
            $0.left.equalTo(productImageView.snp.right).offset(15)
        }
        
        productSubNameLabel.snp.makeConstraints {
            $0.top.equalTo(productNameLabel.snp.bottom).offset(4)
            $0.left.equalTo(productNameLabel)
        }
        
        sizeCollectionView.snp.makeConstraints {
            $0.top.equalTo(productImageView.snp.bottom).offset(35)
            $0.horizontalEdges.equalToSuperview().inset(15)
            $0.height.equalTo(102)
        }
        
        divideLine.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-101)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(2)
        }
        
        
        quickButton.snp.makeConstraints {
            $0.top.equalTo(divideLine.snp.bottom).offset(10)
            $0.left.equalToSuperview().offset(16)
            $0.width.equalTo(simpleButton)
            $0.height.equalTo(52)
        }
        
        simpleButton.snp.makeConstraints {
            $0.top.equalTo(quickButton)
            $0.left.equalTo(quickButton.snp.right).offset(6)
            $0.right.equalToSuperview().offset(-16)
            $0.height.equalTo(52)
        }
        
    }
}




