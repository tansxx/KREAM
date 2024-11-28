//
//  LoginModel.swift
//  UMS_kream
//
//  Created by 강희정 on 9/25/24.
//

import Foundation

class UserInfo {
    private let userDefaults = UserDefaults.standard
    
    private let emailKey = "userEmail"
    private let passwordKey = "userPwd"
    
    // 프로필 데이터 로드
    func loadProfileData() -> (email: String, password: String) {
        let email = userDefaults.string(forKey: emailKey) ?? ""
        let password = userDefaults.string(forKey: passwordKey) ?? ""
        return (email, password)
    }
    
    // 이메일 저장 및 불러오기
    func setEmail(_ email: String) {
        userDefaults.set(email, forKey: emailKey)
    }
    
    func loadEmail() -> String? {
        return userDefaults.string(forKey: emailKey)
    }
    
    // 비밀번호 저장 및 불러오기
    func setPassword(_ password: String) {
        userDefaults.set(password, forKey: passwordKey)
    }
    
    func loadPassword() -> String? {
        return userDefaults.string(forKey: passwordKey)
    }
}
