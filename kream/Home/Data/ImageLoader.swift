//
//  ImageLoader.swift
//  kream
//
//  Created by 강희정 on 11/30/24.
//

import Foundation
import Kingfisher
import UIKit

struct ImageLoader {
    
    static func configureCache() {
        let cache = ImageCache.default
        cache.memoryStorage.config.totalCostLimit = 50 * 1024 * 1024
        cache.diskStorage.config.sizeLimit = 100 * 1024 * 1024
    }
    
    @MainActor static func loadImage(into imageView: UIImageView, from url: String?, placeholder: UIImage? = nil) {
            guard let urlString = url, let imageURL = URL(string: urlString) else {
                imageView.image = placeholder
                return
            }


        
        imageView.kf.setImage(
            with: imageURL,
            placeholder: placeholder
        )
    }
}
