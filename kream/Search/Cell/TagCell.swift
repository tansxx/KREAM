//
//  TagCollectionViewCell.swift
//  kream
//
//  Created by 강희정 on 11/25/24.
//

import UIKit
import SnapKit
import Then

class TagCell: UICollectionViewCell {
    static let identifier = "TagCell"
    
    public lazy var titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 13.5, weight: .light)
        $0.textColor = .black
        $0.textAlignment = .center
    }
    
    public lazy var tagBack = UIView().then {
        $0.backgroundColor = UIColor(named: "F6F6F6") ?? .systemGray6
        $0.layer.cornerRadius = 18
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(named: "ECECEC")?.cgColor ?? UIColor.systemGray4.cgColor
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addComponents() {
        contentView.addSubview(tagBack)
        
        tagBack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        tagBack.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(11)
            make.top.bottom.equalToSuperview().inset(8)
        }
    }
    
    //MARK: - 너비 설정
        static func fittingSize(availableHeight: CGFloat, name: String?) -> CGSize {
            let cell = TagCell()
            cell.configure(name: name)
            
            let targetSize = CGSize(width: UIView.layoutFittingCompressedSize.width, height: availableHeight)
            
            let size = cell.contentView.systemLayoutSizeFitting(
                targetSize,
                withHorizontalFittingPriority: .fittingSizeLevel,
                verticalFittingPriority: .required
            )
            return CGSize(width: size.width, height: availableHeight)
        }

        
        func configure(name: String?) {
            titleLabel.text = name
        }
    }
