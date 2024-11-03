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
    private let recommendView = RecommendView()
    
    private lazy var homeView = HomeView().then {
        $0.searchButton.isUserInteractionEnabled = true
        $0.searchButton.addTarget(self, action: #selector(searchbtnTap), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = homeView
        
        setupAction()
        setupDelegate()
        
        // 각 컬렉션 뷰에 셀 등록
        homeView.homeCollectionView.register(RecommendViewCell.self, forCellWithReuseIdentifier: RecommendViewCell.identifier)
        homeView.conductCollectionView.register(JustDroppedViewCell.self, forCellWithReuseIdentifier: JustDroppedViewCell.identifier)
        homeView.challengeCollectionView.register(instaViewCell.self, forCellWithReuseIdentifier: instaViewCell.identifier)
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
    
    private func setupDelegate() {
        homeView.homeCollectionView.dataSource = self
        homeView.homeCollectionView.delegate = self
        
        homeView.conductCollectionView.dataSource = self
        homeView.conductCollectionView.delegate = self
        
        homeView.challengeCollectionView.dataSource = self
        homeView.challengeCollectionView.delegate = self
    }
    
    @objc
    private func segmentedControlValueChanged(segment: UISegmentedControl) {
        // 세그먼트 컨트롤 변경 시 처리할 로직 추가
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == homeView.homeCollectionView {
            return RecommendModel.dummy().count
        } else if collectionView == homeView.conductCollectionView {
            return JustDroppedModel.dummy().count
        } else if collectionView == homeView.challengeCollectionView {
            return InstaModel.dummy().count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == homeView.homeCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendViewCell.identifier, for: indexPath) as? RecommendViewCell else {
                return UICollectionViewCell()
            }
            let list = RecommendModel.dummy()
            cell.imageView.image = list[indexPath.row].image
            cell.titleLabel.text = list[indexPath.row].name
            return cell
            
        } else if collectionView == homeView.conductCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: JustDroppedViewCell.identifier, for: indexPath) as? JustDroppedViewCell else {
                return UICollectionViewCell()
            }
            let list = JustDroppedModel.dummy()
            cell.imageView.image = UIImage(named: list[indexPath.row].droppedImage)
            cell.transactionLabel.text = list[indexPath.row].transaction
            cell.brandNameLabel.text = list[indexPath.row].brandName
            cell.productNameLabel.text = list[indexPath.row].productName
            cell.productPriceLabel.text = list[indexPath.row].price
            return cell
            
        } else if collectionView == homeView.challengeCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: instaViewCell.identifier, for: indexPath) as? instaViewCell else {
                return UICollectionViewCell()
            }
            let list = InstaModel.dummy()
            cell.imageView.image = UIImage(named: list[indexPath.row].instaImage)
            cell.idLabel.text = list[indexPath.row].instaId
            return cell
        }
        return UICollectionViewCell()
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == homeView.homeCollectionView {
            return CGSize(width: 61, height: 61)
        } else if collectionView == homeView.conductCollectionView {
            return CGSize(width: 142, height: 237)
        } else if collectionView == homeView.challengeCollectionView {
            return CGSize(width: 124, height: 165)
        }
        return CGSize(width: 50, height: 50)
    }
}
