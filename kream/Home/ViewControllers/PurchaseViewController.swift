//
//  PurchaseViewController.swift
//  kream
//
//  Created by 강희정 on 11/5/24.
//

import UIKit

class PurchaseViewController: UIViewController {
    private lazy var purchaseView = PurchaseView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = purchaseView
        
        setupDelegate()
        
        purchaseView.sizeCollectionView.register(SizeViewCell.self, forCellWithReuseIdentifier: SizeViewCell.identifier)
        
        purchaseView.closeButton.addTarget(self, action: #selector(closebtnTap), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
            tabBarController?.tabBar.isHidden = true
        }
        
    override func viewWillDisappear(_ animated: Bool) {
            tabBarController?.tabBar.isHidden = false
        }

    

    private func setupDelegate() {
        purchaseView.sizeCollectionView.dataSource = self
        purchaseView.sizeCollectionView.delegate = self
    }
    
    @objc
    private func closebtnTap() {
        dismiss(animated: true, completion: nil)
    }

}

extension PurchaseViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return SizeModel.dummy().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SizeViewCell.identifier, for: indexPath) as? SizeViewCell else {
            return UICollectionViewCell()
        }
        
        let list = SizeModel.dummy()
        cell.sizeLabel.text = list[indexPath.row].sizeLabel
        cell.priceLabel.text = list[indexPath.row].priceLabel
        
        return cell
    }
}
