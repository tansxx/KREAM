//
//  SizeModel.swift
//  kream
//
//  Created by 강희정 on 11/5/24.
//

import Foundation

struct SizeModel {
    let sizeLabel: String
    let priceLabel: String
}

extension SizeModel {
    static func dummy() -> [SizeModel] {
        return [
            SizeModel(sizeLabel: "S", priceLabel: "360,000"),
            SizeModel(sizeLabel: "M", priceLabel: "360,000"),
            SizeModel(sizeLabel: "L", priceLabel: "360,000"),
            SizeModel(sizeLabel: "XL", priceLabel: "360,000"),
            SizeModel(sizeLabel: "XXL", priceLabel: "360,000")
        ]
    }
}
