//
//  SavedCell.swift
//  kream
//
//  Created by 강희정 on 10/4/24.
//

import UIKit
import SnapKit
import Then

class SavedCell: UITableViewCell {
    
    static let identifier = "SavedCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addComponents()
        self.setConstaints()
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.savedImageView.image = nil
        self.savedInfo.text = nil
        self.savedName.text = nil
        self.savedPrice.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var savedImageView = UIImageView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private lazy var savedName = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        $0.textColor = .black
        $0.textAlignment = .left
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    
    private lazy var savedInfo = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 9, weight: .regular)
        $0.textColor = .lightGray
        $0.textAlignment = .left
        $0.numberOfLines = 0
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private lazy var savedPrice = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        $0.textColor = .black
        $0.textAlignment = .right
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private lazy var savedButton = UIButton().then {
        let image = UIImage(named: "ic_savebutton")
        $0.setImage(image, for: .normal)
        $0.tintColor = .black
        $0.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func addComponents() {
        self.addSubview(savedImageView)
        self.addSubview(savedName)
        self.addSubview(savedInfo)
        self.addSubview(savedPrice)
        self.addSubview(savedButton)
    }
    
    private func setConstaints() {
        savedImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(13)
            $0.left.equalToSuperview().offset(13)
            $0.bottom.equalToSuperview().offset(-14)
            $0.height.width.equalTo(72)
        }
        
        savedName.snp.makeConstraints {
            $0.top.equalToSuperview().offset(13)
            $0.left.equalTo(savedImageView.snp.right).offset(13)
        }
        
        savedInfo.snp.makeConstraints {
            $0.top.equalTo(savedName.snp.bottom).offset(0)
            $0.left.equalTo(savedImageView.snp.right).offset(13)
            $0.width.equalTo(153)
        }
        
        savedPrice.snp.makeConstraints {
            $0.top.equalToSuperview().offset(67)
            $0.right.equalToSuperview().offset(-16)
            $0.bottom.equalToSuperview().offset(-10)
            
        }
        
        savedButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(18)
            $0.right.equalToSuperview().offset(-17)
            $0.bottom.equalTo(savedPrice.snp.top).offset(-31)
            $0.height.equalTo(18)
            $0.width.equalTo(14)
        }
      }
    
    public func configure(model: SavedModel) {
        self.savedImageView.image = UIImage(named: model.savedImage)
        self.savedName.text = model.savedName
        self.savedInfo.text = model.savedInfo
        self.savedPrice.text = model.savedPrice
        
    }

}
