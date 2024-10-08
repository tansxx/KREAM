//
//  ProfileManageView.swift
//  kream
//
//  Created by 강희정 on 10/1/24.
//

import UIKit
import SnapKit
import Then

class ProfileManageView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 프로필 관리 텍스트
    public lazy var manageLabel = UILabel().then {
        $0.text = "프로필 관리"
        $0.textColor = .black
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var profileImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.image = UIImage(named: "profile_image")
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var infoLabel = UILabel().then {
        $0.text = "프로필 정보"
        $0.textColor = .black
        $0.textAlignment = .left
        $0.font = UIFont.boldSystemFont(ofSize: 18)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var emailLabel = UILabel().then {
        $0.text = "유저 이메일"
        $0.textColor = .black
        $0.textAlignment = .left
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var pwdLabel = UILabel().then {
        $0.text = "유저 비밀번호"
        $0.textColor = .black
        $0.textAlignment = .left
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var emailField = UITextField().then {
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textAlignment = .left
        /*** $0.placeholder = "새로운 이메일을 입력해주세요!"
        $0.attributedPlaceholder = NSAttributedString(string: "새로운 이메일을 입력해주세요!", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]) ***/
        
        $0.frame.size.height = 32
        $0.borderStyle = .roundedRect
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.layer.cornerRadius = 8
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var pwdField = UITextField().then {
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textAlignment = .left
        /*** $0.placeholder = "새로운 비밀번호를 입력해주세요!"
        $0.attributedPlaceholder = NSAttributedString(string: "새로운 비밀번호를 입력해주세요!", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]) ***/
        
        $0.frame.size.height = 32
        $0.borderStyle = .roundedRect
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.layer.cornerRadius = 8
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var emailChangeButton = UIButton().then {
        
        var configuration = UIButton.Configuration.filled()
        
        configuration.title = "변경"
        configuration.baseBackgroundColor = UIColor.white
        configuration.baseForegroundColor = .black
        configuration.titleAlignment = .center
        
        var titleAttribute = AttributedString("변경")
        titleAttribute.font = UIFont.systemFont(ofSize: 14)
        configuration.attributedTitle = titleAttribute
        
        $0.configuration = configuration
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 4
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var pwdChangeButton = UIButton().then {
        
        var configuration = UIButton.Configuration.filled()
        
        configuration.title = "변경"
        configuration.baseBackgroundColor = UIColor.white
        configuration.baseForegroundColor = .black
        configuration.titleAlignment = .center
        
        var titleAttribute = AttributedString("변경")
        titleAttribute.font = UIFont.systemFont(ofSize: 14)
        configuration.attributedTitle = titleAttribute
        
        $0.configuration = configuration
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 4
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    private func addComponents() {
        self.addSubview(manageLabel)
        self.addSubview(profileImageView)
        self.addSubview(infoLabel)
        self.addSubview(emailLabel)
        self.addSubview(pwdLabel)
        self.addSubview(emailField)
        self.addSubview(pwdField)
        self.addSubview(emailChangeButton)
        self.addSubview(pwdChangeButton)

        manageLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(66)
            $0.centerX.equalToSuperview()
        }
        
        profileImageView.snp.makeConstraints {
            $0.top.equalTo(manageLabel.snp.bottom).offset(52)
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(90)
        }
        
        infoLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(20)
            $0.left.equalToSuperview().offset(27)
        }
        
        emailLabel.snp.makeConstraints {
            $0.top.equalTo(infoLabel.snp.bottom).offset(23)
            $0.left.equalToSuperview().offset(27)
        }
        
        emailField.snp.makeConstraints {
            $0.top.equalTo(emailLabel.snp.bottom).offset(4)
            $0.left.equalToSuperview().offset(27)
            $0.height.equalTo(32)
        }
        
        pwdLabel.snp.makeConstraints {
            $0.top.equalTo(emailField.snp.bottom).offset(23)
            $0.left.equalToSuperview().offset(27)
        }
        
        pwdField.snp.makeConstraints {
            $0.top.equalTo(pwdLabel.snp.bottom).offset(4)
            $0.left.equalToSuperview().offset(27)
            $0.height.equalTo(32)
        }
        
        emailChangeButton.snp.makeConstraints {
            $0.centerY.equalTo(emailField)
            $0.top.equalTo(emailLabel.snp.bottom).offset(4)
            $0.left.equalTo(emailField.snp.right).offset(9)
            $0.right.equalToSuperview().offset(-17)
            $0.height.equalTo(32)
            $0.width.equalTo(58)
        }
        
        pwdChangeButton.snp.makeConstraints {
            $0.centerY.equalTo(pwdField)
            $0.top.equalTo(pwdLabel.snp.bottom).offset(4)
            $0.left.equalTo(pwdField.snp.right).offset(9)
            $0.right.equalToSuperview().offset(-17)
            $0.height.equalTo(32)
            $0.width.equalTo(58)
        }
        
    }
}
