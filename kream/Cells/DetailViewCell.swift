//
//  DetailViewCell.swift
//  kream
//
//  Created by 강희정 on 11/5/24.
//

import UIKit
import SnapKit
import Then

class DetailViewCell: UICollectionViewCell {
    static let identifier = "DetailViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    public lazy var imageView = UIImageView().then {
        $0.clipsToBounds = true
    }
    
    private func setupView() {
        addSubview(imageView)
        
        imageView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.width.equalTo(53)
        }
    }
}
