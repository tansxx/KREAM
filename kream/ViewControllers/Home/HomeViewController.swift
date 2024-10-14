//
//  HomeViewController.swift
//  kream
//
//  Created by 강희정 on 9/30/24.
//

import UIKit
import SnapKit
import Then

class HomeViewController: UIViewController, UICollectionViewDelegate {
    private let rootView = HomeView()
    private let recommendView = RecommendView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = homeView
        
        setupAction()
        setupDelegate()
        homeView.homeCollectionView.register(RecommendViewCell.self, forCellWithReuseIdentifier: RecommendViewCell.identifier)
            
    }
    
    private lazy var homeView = HomeView().then {
        $0.searchField.addTarget(
                    self,
                    action: #selector(searchFieldTap),
                    for: .touchUpInside
                )
    }
    
    
    @objc
    private func searchFieldTap() {
        print("Search field tapped!")
        let searchVC = SearchViewController()
        searchVC.modalPresentationStyle = .fullScreen
        present(searchVC, animated: true)
    }

    // collectionview 데이터 바인딩
    private func setupAction() {
        homeView.segmentedControl.addTarget(
            self,
            action: #selector(segmentedControlValueChanged(segment:)),
            for: .valueChanged
        )
    }
    
    private func setupDelegate() {
        homeView.homeCollectionView.dataSource = self
        homeView.homeCollectionView.delegate = self
    }
    
    @objc
    private func segmentedControlValueChanged(segment: UISegmentedControl) {
        // 세그먼트 컨트롤 변경 시 처리할 로직 추가
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return RecommendModel.dummy().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendViewCell", for: indexPath) as? RecommendViewCell else {
            return UICollectionViewCell()
        }
        let list = RecommendModel.dummy()
        
        cell.imageView.image = list[indexPath.row].image
        cell.titleLabel.text = list[indexPath.row].name
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 61, height: 61) // 셀 크기 설정
    }
}
