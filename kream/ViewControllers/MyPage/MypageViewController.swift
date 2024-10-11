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
        
        // 프로필 사진을 UserDefaults에 저장
        if let profileImage = myPageView.profileImage.image {
            let imageData = profileImage.pngData()
            UserDefaults.standard.set(imageData, forKey: "profileImage")
        }
    }

    @objc
    private func profilemanagebtnTap() {
        let profileManageVC = ProfileManageViewController()
        navigationController?.pushViewController(profileManageVC, animated: true)
    }
}
