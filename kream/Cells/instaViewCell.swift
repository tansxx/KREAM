//
//  instaViewCell.swift
//  kream
//
//  Created by 강희정 on 11/3/24.
//

import UIKit
import SnapKit
import Then

class instaViewCell: UICollectionViewCell {
    static let identifier = "instaViewCell"
    
    
    public lazy var imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 8
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var idLabel = UILabel().then {
        $0.textColor = .white
        $0.textAlignment = .left
        $0.font = UIFont.systemFont(ofSize: 12)
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
        addSubview(idLabel)
        
        imageView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.width.equalTo(124)
            $0.height.equalTo(165)
        }
        
        idLabel.snp.makeConstraints {
            $0.bottom.equalTo(imageView.snp.bottom).offset(-11)
            $0.left.equalTo(imageView.snp.left).offset(10)
        }
        
    }
}
