//
//  LoginView.swift
//  UMS_kream
//btn 
//  Created by 강희정 on 9/25/24.
//

import UIKit
import SnapKit

class LoginView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 상단 로고 이미지
    public lazy var mainLogoImage: UIImageView = {
            let imageView = UIImageView()
            
            imageView.image = UIImage(named: "kream-logo")
            imageView.contentMode = .scaleAspectFill
            
            return imageView
        }()
    
    public lazy var idLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.black
        label.textAlignment = .left
        label.text = "이메일 주소"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    public lazy var pwdLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.black
        label.textAlignment = .left
        label.text = "비밀번호"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    public lazy var idTextField: UITextField = {
        var textField = UITextField()
        
        textField.font = UIFont.systemFont(ofSize: 12)
        textField.textAlignment = .left
        textField.attributedPlaceholder = NSAttributedString(string: "예) kream@kream.co.kr", attributes: [.foregroundColor: UIColor.lightGray])
        
        textField.frame.size.height = 34
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.cornerRadius = 15
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    
    public lazy var pwdTextField: UITextField = {
        var textField = UITextField()
        
        textField.font = UIFont.systemFont(ofSize: 12)
        textField.textAlignment = .left
        textField.attributedPlaceholder = NSAttributedString(string: "비밀번호를 입력해주세요", attributes: [.foregroundColor: UIColor.lightGray])
        
        textField.frame.size.height = 34
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.cornerRadius = 15
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private lazy var titleContainer: AttributeContainer = {
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 13)
        container.foregroundColor = UIColor.white
        return container
    }()
    
    public lazy var loginButton: UIButton = {
        let btn = UIButton()
        
        var configuration = UIButton.Configuration.filled()
        
        configuration.baseBackgroundColor = UIColor.lightGray
        configuration.baseForegroundColor = UIColor.white
        configuration.title = "로그인"
        configuration.titleAlignment = .center
        
        btn.configuration = configuration
        btn.layer.cornerRadius = 8
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
    }()
    
    public lazy var kakaoButton: UIButton = {
        let btn = UIButton()
        let icon = UIImageView()
        
        var configuration = UIButton.Configuration.plain()
        
        configuration.title = "카카오로 로그인"
        configuration.baseForegroundColor = UIColor.black
        icon.image = UIImage(named: "kakao-icon")
        
        btn.addSubview(icon)
        
        icon.snp.makeConstraints {
            $0.leading.equalTo(17)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(14)
            $0.width.equalTo(15)
        }
        
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 15)
        
        btn.configuration = configuration
        btn.layer.borderColor = UIColor.lightGray.cgColor
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = 10
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
    }()
    
    public lazy var appleButton: UIButton = {
        let btn = UIButton()
        let icon = UIImageView()
        
        var configuration = UIButton.Configuration.plain()
        
        configuration.title = "Apple로 로그인"
        configuration.baseForegroundColor = UIColor.black
        icon.image = UIImage(named: "apple-icon")

        btn.addSubview(icon)
        
        icon.snp.makeConstraints {
            $0.leading.equalTo(17)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(14)
            $0.width.equalTo(15)
        }
        
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 15)
        
        btn.configuration = configuration
        btn.layer.borderColor = UIColor.lightGray.cgColor
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = 10
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
    }()
    
    // autolayout 설정
    
    private func addComponents() {
        self.addSubview(mainLogoImage)
        self.addSubview(idLabel)
        self.addSubview(pwdLabel)
        self.addSubview(idTextField)
        self.addSubview(pwdTextField)
        self.addSubview(loginButton)
        self.addSubview(kakaoButton)
        self.addSubview(appleButton)
        
        mainLogoImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(126)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(75)
            $0.width.equalTo(287)
        }
        
        idLabel.snp.makeConstraints {
            $0.top.equalTo(mainLogoImage.snp.bottom).offset(87)
            $0.leading.equalToSuperview().offset(45)
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(idLabel.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(303)
        }
        
        pwdLabel.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(17)
            $0.leading.equalTo(idLabel.snp.leading)
        }
        
        pwdTextField.snp.makeConstraints {
            $0.top.equalTo(pwdLabel.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(303)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(pwdTextField.snp.bottom).offset(17)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(38)
            $0.width.equalTo(303)
        }
        
        kakaoButton.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(87)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(40)
            $0.width.equalTo(298)
        }
        
        appleButton.snp.makeConstraints {
            $0.top.equalTo(kakaoButton.snp.bottom).offset(22)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(40)
            $0.width.equalTo(298)
        }
       
    }

}
