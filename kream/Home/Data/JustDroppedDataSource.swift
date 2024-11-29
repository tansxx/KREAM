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
        if let droppedImage = items[indexPath.row].droppedImage {
            cell.imageView.image = UIImage(named: droppedImage)
        } else if let urlImage = items[indexPath.row].urlImage {
            ImageLoader.loadImage(into: cell.imageView, from: urlImage, placeholder: UIImage(named: "default_image"))
        }
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
