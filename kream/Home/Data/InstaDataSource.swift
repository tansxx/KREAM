//
//  InstaDataSource.swift
//  kream
//
//  Created by 강희정 on 11/11/24.
//

import UIKit

class InstaDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private let items = InstaModel.dummy()

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: instaViewCell.identifier, for: indexPath) as? instaViewCell else {
            return UICollectionViewCell()
        }
        cell.imageView.image = UIImage(named: items[indexPath.row].instaImage)
        cell.idLabel.text = items[indexPath.row].instaId
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 124, height: 165)
    }
}
