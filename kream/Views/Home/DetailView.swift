//
//  DetailView.swift
//  kream
//
//  Created by 강희정 on 11/5/24.
//

import UIKit
import SnapKit
import Then

class DetailView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    private lazy var productImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.image = UIImage(named: "main_img")
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.itemSize = CGSize(width: 53, height: 53)
        $0.minimumInteritemSpacing = 8
        $0.scrollDirection = .horizontal
    }).then {
        $0.showsHorizontalScrollIndicator = false
        $0.isScrollEnabled = true
        $0.register(DetailViewCell.self, forCellWithReuseIdentifier: DetailViewCell.identifier)
    }
    
    private lazy var purchaseLabel = UILabel().then {
        $0.text = "즉시 구매가"
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.textAlignment = .left
        $0.textColor = .black
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private lazy var priceLabel = UILabel().then {
        $0.text = "228,000원"
        $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .black
        $0.textAlignment = .left
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private lazy var conductNameLabel = UILabel().then {
        $0.text = "Matin Kim Logo Coating Jumper"
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.textColor = .black
        $0.textAlignment = .left
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private lazy var conductSubNameLabel = UILabel().then {
        $0.text = "마땡킴 로고 코팅 점퍼 블랙"
        $0.textColor = ._9_C_9_C_9_C
        $0.textAlignment = .left
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private lazy var divideLine = UIView().then {
        $0.backgroundColor = .F_3_F_3_F_3
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private lazy var saveButton = UIButton().then {
        let image = UIImage(named: "ic_save")
        $0.setImage(image, for: .normal)
        $0.tintColor = .black
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(setBtnTap), for: .touchUpInside)
    }
    
    private lazy var saveCountLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.text = "2,122"
        $0.textAlignment = .center
        $0.textColor = .black
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    class CustomButton: UIButton {
        private let mainLabel = UILabel().then {
            $0.textColor = .white
            $0.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        }
        
        private let priceLabel = UILabel().then {
            $0.textColor = .white
            $0.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        }
        
        private let subLabel = UILabel().then {
            $0.font = UIFont.systemFont(ofSize: 10)
        }
        
        init(mainText: String, priceText: String, subText: String, backgroundColor: UIColor, subColor: UIColor) {
            super.init(frame: .zero)
            
            self.backgroundColor = backgroundColor
            self.layer.cornerRadius = 10
            self.clipsToBounds = true
            
            self.mainLabel.text = mainText
            self.priceLabel.text = priceText
            self.subLabel.text = subText
            self.subLabel.textColor = subColor
            
            self.addSubview(mainLabel)
            self.addSubview(priceLabel)
            self.addSubview(subLabel)
            
            mainLabel.snp.makeConstraints {
                $0.left.equalToSuperview().offset(10)
                $0.centerY.equalToSuperview()
            }
            
            priceLabel.snp.makeConstraints {
                $0.left.equalTo(mainLabel.snp.right).offset(21)
                $0.top.equalToSuperview().offset(8)
            }
            
            subLabel.snp.makeConstraints {
                $0.left.equalTo(priceLabel)
                $0.top.equalTo(priceLabel.snp.bottom).offset(2)
            }
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    public lazy var buyButton = CustomButton(mainText: "구매", priceText: "345,000", subText: "즉시 구매가", backgroundColor: .EF_6254, subColor: .A_33723)
    private lazy var sellButton = CustomButton(mainText: "판매", priceText: "396,000", subText: "즉시 판매가", backgroundColor: ._41_B_97_A, subColor: ._1_F_7745)
 
    
    private func addComponents() {
        [
            productImageView, collectionView, purchaseLabel, priceLabel, conductNameLabel, conductSubNameLabel, divideLine, saveButton, saveCountLabel, buyButton, sellButton
        ].forEach {addSubview($0)}
        
        productImageView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(10)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(374)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(productImageView.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(53)
        }
        
        purchaseLabel.snp.makeConstraints {
            $0.top.equalTo(collectionView.snp.bottom).offset(23)
            $0.left.equalToSuperview().offset(16)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(purchaseLabel.snp.bottom).offset(4)
            $0.left.equalTo(purchaseLabel)
        }
        
        conductNameLabel.snp.makeConstraints {
            $0.top.equalTo(priceLabel.snp.bottom).offset(18)
            $0.left.equalTo(purchaseLabel)
        }
        
        conductSubNameLabel.snp.makeConstraints {
            $0.top.equalTo(conductNameLabel.snp.bottom).offset(6)
            $0.left.equalTo(conductNameLabel)
        }
        
        divideLine.snp.makeConstraints {
            $0.top.equalTo(conductSubNameLabel.snp.bottom).offset(54)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(2)
        }
        
        saveButton.snp.makeConstraints {
            $0.top.equalTo(divideLine.snp.bottom).offset(16)
            $0.left.equalToSuperview().offset(21.64)
            $0.width.equalTo(16)
            $0.height.equalTo(19.5)
        }
        
        saveCountLabel.snp.makeConstraints {
            $0.top.equalTo(saveButton.snp.bottom).offset(1)
            $0.centerX.equalTo(saveButton)
        }
        
        buyButton.snp.makeConstraints {
            $0.top.equalTo(divideLine.snp.bottom).offset(8)
            $0.left.equalTo(saveCountLabel.snp.right).offset(19)
            $0.width.equalTo(sellButton)
            $0.height.equalTo(49)
        }
        
        sellButton.snp.makeConstraints {
            $0.top.equalTo(divideLine.snp.bottom).offset(8)
            $0.left.equalTo(buyButton.snp.right).offset(6)
            $0.right.equalToSuperview().offset(-10)
            $0.height.equalTo(49)
        }
        
        
        
        
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
}
