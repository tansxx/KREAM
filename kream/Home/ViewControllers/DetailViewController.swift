//
//  DetailViewController.swift
//  KREAM
//
//  Created by 강희정 on 11/5/24.
//

import UIKit

class DetailViewController: UIViewController, UICollectionViewDelegate {
    private lazy var detailView = DetailView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = detailView
        
        let backButton = UIBarButtonItem(image: UIImage(named: "ic_back"), style: .plain, target: self, action: #selector(backbtntap))
            backButton.tintColor = ._848484
        self.navigationItem.leftBarButtonItem = backButton
        
        setupDelegate()
        
        detailView.collectionView.register(DetailViewCell.self,
                                           forCellWithReuseIdentifier: DetailViewCell.identifier)
        
        detailView.buyButton.addTarget(self, action: #selector(purchasebtntap), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
            tabBarController?.tabBar.isHidden = true
        }
        
    override func viewWillDisappear(_ animated: Bool) {
            tabBarController?.tabBar.isHidden = false
        }
    
    private func setupDelegate() {
        detailView.collectionView.dataSource = self
        detailView.collectionView.delegate = self
    }
    
    @objc func backbtntap() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc
    private func purchasebtntap() {
        let purchaseViewController = PurchaseViewController()
        present(purchaseViewController, animated: true, completion: nil)
    }
    
}

extension DetailViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DetailModel.dummy().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailViewCell.identifier, for: indexPath) as? DetailViewCell else {
            return UICollectionViewCell()
        }
        let list = DetailModel.dummy()
        
        cell.imageView.image = UIImage(named: list[indexPath.row].detailImage)
        
        return cell
    }
}
