//
//  JustDroppedDataSource.swift
//  kream
//
//  Created by 강희정 on 11/11/24.
//

import UIKit

class JustDroppedDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private let items = JustDroppedModel.dummy()

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: JustDroppedViewCell.identifier, for: indexPath) as? JustDroppedViewCell else {
            return UICollectionViewCell()
        }
        cell.imageView.image = UIImage(named: items[indexPath.row].droppedImage)
        cell.transactionLabel.text = items[indexPath.row].transaction
        cell.brandNameLabel.text = items[indexPath.row].brandName
        cell.productNameLabel.text = items[indexPath.row].productName
        cell.productPriceLabel.text = items[indexPath.row].price
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 142, height: 237)
    }
}
