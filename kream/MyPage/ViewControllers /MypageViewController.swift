//
//  MypageViewController.swift
//  kream
//
//  Created by 강희정 on 9/30/24.
//

import UIKit
import SnapKit

class MypageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        loadUserInfo()
    }
    
    private lazy var myPageView: MypageView = {
        let view = MypageView()
        view.profileManageButton.addTarget(self, action: #selector(profilemanagebtnTap), for: .touchUpInside)
        return view
    }()

    private func setupView() {
        view.addSubview(myPageView)
        
        myPageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.height.equalToSuperview().offset(297)
        }
        
        // 저장된 프로필 이미지를 키체인에서 로드
        if let profileImageUrlString = KeychainHelper.load(key: "kakaoProfileImage"),
           let url = URL(string: profileImageUrlString) {
            loadImage(from: url) { [weak self] image in
                DispatchQueue.main.async {
                    self?.myPageView.profileImage.image = image
                }
            }
        } else {
            // 기본 프로필 이미지 설정
            myPageView.profileImage.image = UIImage(named: "defaultProfileImage")
        }
    }

    @objc
    private func profilemanagebtnTap() {
        let profileManageVC = ProfileManageViewController()
        navigationController?.pushViewController(profileManageVC, animated: true)
    }
    
    private func loadUserInfo() {
        // 키체인에서 저장된 닉네임을 불러오기
        if let nickname = KeychainHelper.load(key: "kakaoNickname") {
            // nameLabel에 텍스트 설정
            myPageView.nameLabel.text = "\(nickname)"
        } else {
            // 닉네임이 없을 경우 기본값 설정
            myPageView.nameLabel.text = "닉네임 없음"
        }
    }

    private func loadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("이미지 로드 실패: \(error.localizedDescription)")
                completion(nil)
                return
            }

            guard let data = data, let image = UIImage(data: data) else {
                completion(nil)
                return
            }

            completion(image)
        }.resume()
    }
}
