//
//  HomeViewController.swift
//  kream
//
//  Created by 강희정 on 9/30/24.
//

import UIKit
import SnapKit
import Then

class HomeViewController: UIViewController, UICollectionViewDelegate, UISearchBarDelegate {
    private let rootView = HomeView()
    
    private let recommendDataSource = RecommendDataSource()
    private let justDroppedDataSource = JustDroppedDataSource()
    private let instaDataSource = InstaDataSource()
    
    private lazy var homeView = HomeView().then {
        $0.searchButton.isUserInteractionEnabled = true
        $0.searchButton.addTarget(self, action: #selector(searchbtnTap), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = homeView
        
        setupAction()
//        setupDelegate()
        setupCollectionViewDataSource()
        
        // 각 컬렉션 뷰에 셀 등록
            homeView.homeCollectionView.register(RecommendViewCell.self, forCellWithReuseIdentifier: RecommendViewCell.identifier)
            homeView.conductCollectionView.register(JustDroppedViewCell.self, forCellWithReuseIdentifier: JustDroppedViewCell.identifier)
            homeView.challengeCollectionView.register(instaViewCell.self, forCellWithReuseIdentifier: instaViewCell.identifier)
        }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true // 뷰 컨트롤러가 나타날 때 숨기기
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false // 뷰 컨트롤러가 사라질 때 나타내기
    }

    @objc
    private func searchbtnTap() {
        let searchVC = SearchViewController()
        navigationController?.pushViewController(searchVC, animated: true)
    }

    // collectionview 데이터 바인딩
    private func setupAction() {
        homeView.segmentedControl.addTarget(
            self,
            action: #selector(segmentedControlValueChanged(segment:)),
            for: .valueChanged
        )
    }
    
    private func setupCollectionViewDataSource() {
            homeView.homeCollectionView.dataSource = recommendDataSource
            homeView.homeCollectionView.delegate = self

            homeView.conductCollectionView.dataSource = justDroppedDataSource
            homeView.conductCollectionView.delegate = self

            homeView.challengeCollectionView.dataSource = instaDataSource
            homeView.challengeCollectionView.delegate = self
        }
    
    @objc
    private func segmentedControlValueChanged(segment: UISegmentedControl) {
        // 세그먼트 컨트롤 변경 시 처리할 로직 추가
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == homeView.conductCollectionView && indexPath.item == 0 {
            let detailVC = DetailViewController()
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}
