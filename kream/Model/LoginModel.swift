//
//  LoginModel.swift
//  UMS_kream
//
//  Created by 강희정 on 9/25/24.
//
import Foundation

struct LoginModel {
    private let userDefaults = UserDefaults.standard
    
    var email: String
    var pwd: String
    
    public func setEmail(_ text: String) {
        userDefaults.set(text, forKey: "email")
    }
    
    public func setPwd(_ text: String) {
        userDefaults.set(text, forKey: "pwd")
    }
    
    public func loadEmail() -> String? {
        return userDefaults.string(forKey: "email")
    }
    
    public func loadPwd() -> String? {
        return userDefaults.string(forKey: "pwd")
    }
}

