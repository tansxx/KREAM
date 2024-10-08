//
//  ProfileManageViewController.swift
//  kream
//
//  Created by 강희정 on 10/1/24.
//

import UIKit

class ProfileManageViewController: UIViewController {
    
    var userEmail: String = ""
    var userPwd: String = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = profileManageView
        
        let backButton = UIBarButtonItem(image: UIImage(named: "ic_back"), style: .plain, target: self, action: #selector(backbtntap))
            backButton.tintColor = .black
        self.navigationItem.leftBarButtonItem = backButton
        
        // 이메일 비밀번호 필드 비활성화
        profileManageView.emailField.isUserInteractionEnabled = false
        profileManageView.pwdField.isUserInteractionEnabled = false
        
        loadProfileData()
        
        profileManageView.emailChangeButton.addTarget(self, action: #selector(handleEmailChange), for: .touchUpInside)
        profileManageView.pwdChangeButton.addTarget(self, action: #selector(handlePwdChange), for: .touchUpInside)

    }
    
    private lazy var profileManageView: ProfileManageView = {
        let view = ProfileManageView()
        
        return view
    }()
    
    @objc func backbtntap() {
        
        navigationController?.popViewController(animated: true)
    }
    
    private func loadProfileData() {
        // 이메일과 비밀번호
        let savedEmail = UserDefaults.standard.string(forKey: "userEmail") ?? ""
        let savedPwd = UserDefaults.standard.string(forKey: "userPwd") ?? ""
        
        profileManageView.emailField.text = savedEmail.isEmpty ? nil : savedEmail
        profileManageView.pwdField.text = savedPwd.isEmpty ? nil : savedPwd
        
    }
    
    // 이메일 변경 버튼 액션
    @objc private func handleEmailChange() {
        if profileManageView.emailChangeButton.title(for: .normal) == "변경" {
            profileManageView.emailField.text = nil
            let attributedPlaceholder = NSAttributedString(
                string: "새로운 이메일을 입력해 주세요!",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            profileManageView.emailField.attributedPlaceholder = attributedPlaceholder
            
            profileManageView.emailField.isUserInteractionEnabled = true
            profileManageView.emailChangeButton.setTitle("확인", for: .normal)
        } else {
            if let updatedEmail = profileManageView.emailField.text {
                UserDefaults.standard.set(updatedEmail, forKey: "userEmail")
            }
            profileManageView.emailField.isUserInteractionEnabled = false
            profileManageView.emailChangeButton.setTitle("변경", for: .normal)
        }
    }
    
    // 비밀번호 변경 버튼 액션
    @objc private func handlePwdChange() {
        if profileManageView.pwdChangeButton.title(for: .normal) == "변경" {
            profileManageView.pwdField.text = nil
            let attributedPwdPlaceholder = NSAttributedString(
                string: "새로운 비밀번호를 입력해 주세요!",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
            )
            profileManageView.pwdField.attributedPlaceholder = attributedPwdPlaceholder
            
            profileManageView.pwdField.isUserInteractionEnabled = true
            profileManageView.pwdChangeButton.setTitle("확인", for: .normal)
        } else {
            if let updatedPwd = profileManageView.pwdField.text {
                UserDefaults.standard.set(updatedPwd, forKey: "userPwd")
            }
            profileManageView.pwdField.isUserInteractionEnabled = false
            profileManageView.pwdChangeButton.setTitle("변경", for: .normal)
        }
    }
    
    

}
