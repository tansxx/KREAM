//
//  SearchViewController.swift
//  kream
//
//  Created by 강희정 on 10/14/24.
//

import UIKit

class SearchViewController: UIViewController {
    
    private let dummy: [String] = [
        "채원 슈프림 후리스",
        "나이키V2K런",
        "뉴발란스996",
        "신상 나이키 콜라보",
        "허그 FW 패딩",
        "벨루어 눕시"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(searchView)
        
        searchView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        setupDelegate()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    private lazy var searchView = SearchView().then {
        $0.cancelButton.addTarget(self,action: #selector(cancelButtonTapped), for: .touchUpInside)
        
        $0.searchButton.addTarget(self, action: #selector(searchFieldTapped), for: .touchUpInside)
        
    }
    
    private func setupDelegate() {
        searchView.tagCollectionView.delegate = self
        searchView.tagCollectionView.dataSource = self
    }
    
    
    @objc
    private func cancelButtonTapped() {
        // 현재 표시된 모든 모달을 닫고 홈 화면으로 전환
        var presentingVC = self.presentingViewController

        // 최상위 뷰 컨트롤러를 찾음
        while let parent = presentingVC?.presentingViewController {
            presentingVC = parent
        }

        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            // 새로운 홈 화면 설정
            let homeViewController = HomeViewController()
            let navigationController = UINavigationController(rootViewController: homeViewController)
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
        }
    }
    
    @objc
    private func searchFieldTapped() {
        let searchDetailVC = SearchDetailViewController()
        searchDetailVC.modalPresentationStyle = .fullScreen
        searchDetailVC.view.backgroundColor = .white
        present(searchDetailVC, animated: true)
    }
}

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dummy.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCell.identifier, for: indexPath) as? TagCell else {
            return UICollectionViewCell()
        }
        cell.configure(name: dummy[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return TagCell.fittingSize(availableHeight: 32, name: dummy[indexPath.item])
    }
}
