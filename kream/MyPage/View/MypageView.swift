//
//  MypageView.swift
//  kream
//
//  Created by 강희정 on 9/30/24.
//

import UIKit
import SnapKit
import Then

class MypageView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 설정
    public lazy var settingButton: UIButton = {
        let button = UIButton()
        var configuration = UIButton.Configuration.plain()
        
        button.setImage(UIImage(named: "ic_setting"), for: .normal)
        button.tintColor = .black
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    // 카메라
    public lazy var cameraButton: UIButton = {
        let button = UIButton()
        var configuration = UIButton.Configuration.plain()
        
        button.setImage(UIImage(named: "ic_camera"), for: .normal)
        button.tintColor = .black
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    // 프로필 관리 버튼
    public lazy var profileManageButton: UIButton = {
        let button = UIButton()
        var configuration = UIButton.Configuration.filled()
        
        configuration.title = "프로필 관리"
        configuration.titleAlignment = .center
        configuration.baseForegroundColor = .black
        configuration.baseBackgroundColor = .white
        
        var titleAttribute = AttributedString("프로필 관리")
        titleAttribute.font = UIFont.systemFont(ofSize: 9)
        configuration.attributedTitle = titleAttribute
        
        button.configuration = configuration
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    // 프로필 공유 버튼
    public lazy var profileShareButton: UIButton = {
        let button = UIButton()
        var configuration = UIButton.Configuration.filled()
        
        configuration.title = "프로필 공유"
        configuration.titleAlignment = .center
        configuration.baseForegroundColor = .black
        configuration.baseBackgroundColor = .white
        
        var titleAttribute = AttributedString("프로필 공유")
        titleAttribute.font = UIFont.systemFont(ofSize: 9)
        configuration.attributedTitle = titleAttribute
        
        button.configuration = configuration
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    public lazy var profileImage = UIImageView().then {
        $0.image = UIImage(named: "profile_image")
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 45
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var nameLabel = UILabel().then {
        $0.textColor = .black
        $0.textAlignment = .center
        $0.font = UIFont.boldSystemFont(ofSize: 16)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var followerLabel = UILabel().then {
        $0.textColor = .black
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 12)
        
        let fullText = "팔로워 326"
        let attributedStr = NSMutableAttributedString(string: fullText)
        let strrange = (fullText as NSString).range(of: "팔로워")
        let numrange = (fullText as NSString).range(of: "326")
        
        attributedStr.addAttribute(.font, value: UIFont.systemFont(ofSize: 12), range: strrange)
        attributedStr.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 12), range: numrange)
            
        $0.attributedText = attributedStr
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var followingLabel = UILabel().then {
        $0.textColor = .black
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 12)
        
        let fullText = "팔로잉 20"
        let attributedStr = NSMutableAttributedString(string: fullText)
        let strrange = (fullText as NSString).range(of: "팔로잉")
        let numrange = (fullText as NSString).range(of: "20")
        
        attributedStr.addAttribute(.font, value: UIFont.systemFont(ofSize: 12), range: strrange)
        attributedStr.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 12), range: numrange)

        
        $0.attributedText = attributedStr
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func addComponents() {
        self.addSubview(settingButton)
        self.addSubview(cameraButton)
        self.addSubview(profileManageButton)
        self.addSubview(profileShareButton)
        self.addSubview(profileImage)
        self.addSubview(nameLabel)
        self.addSubview(followerLabel)
        self.addSubview(followingLabel)
        
        settingButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(75)
            $0.left.equalToSuperview().offset(32.5)
            $0.height.equalTo(25)
            $0.width.equalTo(25)
        }
        
        cameraButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(75)
            $0.right.equalToSuperview().offset(-33.5)
            $0.height.equalTo(25)
            $0.width.equalTo(25)
        }
        
        profileImage.snp.makeConstraints {
            $0.top.equalTo(settingButton.snp.bottom).offset(26)
            $0.left.equalToSuperview().offset(32.5)
            $0.height.equalTo(90)
            $0.width.equalTo(90)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(settingButton.snp.bottom).offset(47)
            $0.left.equalTo(profileImage.snp.right).offset(16)
            $0.height.equalTo(23)
        }
        
        followerLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(6)
            $0.left.equalTo(profileImage.snp.right).offset(16)
        }
        
        followingLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(6)
            $0.left.equalTo(followerLabel.snp.right).offset(8)
        }
        
        profileManageButton.snp.makeConstraints {
            $0.top.equalTo(profileImage.snp.bottom).offset(26)
            $0.left.equalToSuperview().offset(32.5)
            $0.right.equalTo(profileShareButton.snp.left).offset(-14)
            $0.height.equalTo(26)
            $0.width.equalTo(157)
        }
        
        profileShareButton.snp.makeConstraints {
            $0.top.equalTo(profileImage.snp.bottom).offset(26)
            $0.right.equalToSuperview().offset(-33.5)
            $0.height.equalTo(26)
            $0.width.equalTo(profileManageButton)
        }
    }
}
