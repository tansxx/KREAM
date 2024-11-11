//
//  RecommendDataSource.swift
//  kream
//
//  Created by 강희정 on 11/11/24.
//

import UIKit

class RecommendDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private let items = RecommendModel.dummy()

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendViewCell.identifier, for: indexPath) as? RecommendViewCell else {
            return UICollectionViewCell()
        }
        cell.imageView.image = items[indexPath.row].image
        cell.titleLabel.text = items[indexPath.row].name
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 61, height: 81)
    }
}
