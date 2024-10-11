//
//  RecommendView.swift
//  kream
//
//  Created by 강희정 on 10/11/24.
//

import UIKit
import SnapKit
import Then

class RecommendView: UIView {

    override init(frame: CGRect) {
            super.init(frame: frame)
            self.backgroundColor = .white
            self.addComponents()
        }
        
        required init?(coder: NSCoder) {
              fatalError("init(coder:) has not been implemented")
        }
    
    private lazy var adImageView = UIImageView().then {
        $0.image = UIImage(named: "main_ad")
        $0.contentMode = .scaleAspectFit
    }
    
    private func addComponents() {
        self.addSubview(adImageView)
        
        adImageView.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
            $0.height.equalTo(336)
        }
    }

}
