//
//  ViewController.swift
//  UMS_kream
//
//  Created by 강희정 on 9/25/24.
//

import UIKit
import KakaoSDKUser

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = loginView
        
        loginView.loginButton.addTarget(self, action: #selector(loginbtnTap), for: .touchUpInside)
        loginView.kakaoButton.addTarget(self, action: #selector(kakaologinTap), for: .touchUpInside)
    }
    
    private lazy var loginView: LoginView = {
        let view = LoginView()
        return view
    }()
    
    @objc func kakaologinTap() {
        if UserApi.isKakaoTalkLoginAvailable() {
            UserApi.shared.loginWithKakaoTalk { (oauthToken, error) in
                if let error = error {
                    print("카카오톡 로그인 실패: \(error.localizedDescription)")
                    return
                }
                
                print("loginWithKakaoTalk() success.")
                self.kakaoLogin()
            }
        } else {
            UserApi.shared.loginWithKakaoAccount { (oauthToken, error) in
                if let error = error {
                    print("카카오 계정 로그인 실패: \(error.localizedDescription)")
                    return
                }
                
                print("loginWithKakaoAccount() success.")
                self.kakaoLogin()
            }
        }
    }

    func kakaoLogin() {
        UserApi.shared.me { [weak self] user, error in
            guard let self = self else { return }
            if let error = error {
                print("사용자 정보 요청 실패: \(error.localizedDescription)")
                return
            }

            // 사용자 정보 가져오기
            if let nickname = user?.kakaoAccount?.profile?.nickname,
               let profileImageUrl = user?.kakaoAccount?.profile?.profileImageUrl?.absoluteString { // URL을 String으로 변환
                print("닉네임: \(nickname)")
                print("프로필 이미지 URL: \(profileImageUrl)")

                // 키체인에 닉네임과 프로필 이미지 URL 저장
                KeychainHelper.save(key: "kakaoNickname", value: nickname)
                KeychainHelper.save(key: "kakaoProfileImage", value: profileImageUrl)

                // 화면 전환
                DispatchQueue.main.async {
                    let viewController = BaseViewController()
                    viewController.modalPresentationStyle = .fullScreen
                    self.present(viewController, animated: true) {
                        print("화면 전환 완료")
                    }
                }
            } else {
                print("사용자 정보가 비어 있습니다.")
            }
        }
    }

    @objc func loginbtnTap() {
        guard let email = loginView.idTextField.text, !email.isEmpty,
              let pwd = loginView.pwdTextField.text, !pwd.isEmpty else {
            return
        }
        
        // 이메일과 비밀번호를 UserDefaults에 저장
        UserDefaults.standard.set(email, forKey: "userEmail")
        UserDefaults.standard.set(pwd, forKey: "userPwd")
        
        let viewController = BaseViewController()
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
    }
}
