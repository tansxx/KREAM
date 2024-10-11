//
//  BaseViewController.swift
//  kream
//
//  Created by 강희정 on 9/30/24.
//

import UIKit
import SnapKit

class BaseViewController: UITabBarController {
    private let homeVC = UINavigationController(rootViewController: HomeViewController())
    private let styleVC = StyleViewController()
    private let shopVC = ShopViewController()
    private let savedVC = SavedViewController()
    private let mypageVC = UINavigationController(rootViewController: MypageViewController())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        tabBar.frame.size.height = 90
        
        self.tabBar.tintColor = .black
        self.tabBar.unselectedItemTintColor = .gray
        
        homeVC.tabBarItem = UITabBarItem(title: "HOME", image: UIImage(named: "ic_home")?.withRenderingMode(.alwaysOriginal),tag: 0)
        styleVC.tabBarItem = UITabBarItem(title: "STYLE", image: UIImage(named: "ic_style")?.withRenderingMode(.alwaysOriginal),tag: 1)
        shopVC.tabBarItem = UITabBarItem(title: "SHOP", image: UIImage(named: "ic_shop")?.withRenderingMode(.alwaysOriginal),tag: 2)
        savedVC.tabBarItem = UITabBarItem(title: "SAVED", image: UIImage(named: "ic_saved")?.withRenderingMode(.alwaysOriginal),tag: 3)
        mypageVC.tabBarItem = UITabBarItem(title: "MY", image: UIImage(named: "ic_mypage")?.withRenderingMode(.alwaysOriginal),tag: 4)
        
        self.viewControllers = [homeVC, styleVC, shopVC, savedVC, mypageVC]
    }
    
  
}
