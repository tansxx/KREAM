//
//  ProfileManageViewController.swift
//  kream
//
//  Created by 강희정 on 10/1/24.
//



import UIKit

class ProfileManageViewController: UIViewController {
    private lazy var profileManageView = ProfileManageView()
    private let dataManager = UserInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = profileManageView
        setupNavigation()
        setupView()
        loadProfileData()
    }
    
    private func setupNavigation() {
        let backButton = UIBarButtonItem(image: UIImage(named: "ic_back"), style: .plain, target: self, action: #selector(backButtonTapped))
        backButton.tintColor = .black
        self.navigationItem.leftBarButtonItem = backButton
    }

    private func setupView() {
        // 이메일과 비밀번호 필드 비활성화
        profileManageView.emailField.isUserInteractionEnabled = false
        profileManageView.pwdField.isUserInteractionEnabled = false
        
        // 버튼 액션 추가
        profileManageView.emailChangeButton.addTarget(self, action: #selector(emailChange), for: .touchUpInside)
        profileManageView.pwdChangeButton.addTarget(self, action: #selector(pwdChange), for: .touchUpInside)
    }
    
    private func loadProfileData() {
        let profile = dataManager.loadProfileData()
        profileManageView.emailField.text = profile.email.isEmpty ? nil : profile.email
        profileManageView.pwdField.text = profile.password.isEmpty ? nil : profile.password
    }
    
    // 뒤로 가기 버튼 액션
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }

    // 이메일 변경 버튼 액션
    @objc private func emailChange() {
        toggleField(profileManageView.emailField, changeButton: profileManageView.emailChangeButton, placeholder: "새로운 이메일을 입력해 주세요!")
        if !profileManageView.emailField.isUserInteractionEnabled, let updatedEmail = profileManageView.emailField.text {
            dataManager.setEmail(updatedEmail)
        }
    }

    // 비밀번호 변경 버튼 액션
    @objc private func pwdChange() {
        toggleField(profileManageView.pwdField, changeButton: profileManageView.pwdChangeButton, placeholder: "새로운 비밀번호를 입력해 주세요!")
        if !profileManageView.pwdField.isUserInteractionEnabled, let updatedPwd = profileManageView.pwdField.text {
            dataManager.setPassword(updatedPwd)
        }
    }
  
    

    
    // 필드와 버튼 상태 전환
    private func toggleField(_ textField: UITextField, changeButton: UIButton, placeholder: String) {
        textField.isUserInteractionEnabled.toggle()
        if textField.isUserInteractionEnabled {
            textField.text = nil
            let attributedPlaceholder = NSAttributedString(
                string: placeholder,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
            )
            textField.attributedPlaceholder = attributedPlaceholder
            changeButton.setTitle("확인", for: .normal)
        } else {
            changeButton.setTitle("변경", for: .normal)
        }
    }
}
