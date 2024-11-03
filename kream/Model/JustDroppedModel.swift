//
//  JustDroppedModel.swift
//  kream
//
//  Created by 강희정 on 11/3/24.
//

import Foundation

struct JustDroppedModel {
    let droppedImage: String
    let transaction: String
    let brandName: String
    let productName: String
    let price: String
}

extension JustDroppedModel {
    static func dummy() -> [JustDroppedModel] {
        return [
        JustDroppedModel(droppedImage: "justimage1", transaction: "거래 12.8만", brandName: "MLB", productName: "청키라이너 뉴욕양키스", price: "139,000원"),
        JustDroppedModel(droppedImage: "justimage2", transaction: "거래 15.6만", brandName: "Jordan", productName: "Jordan 1 Retro High OG\nYellow Ochre", price: "228,000원"),
        JustDroppedModel(droppedImage: "justimage4", transaction: "거래 13.9만", brandName: "Human Made", productName: "Human Made x Kaws\nVarsity Jacket #1 Black", price: "2,000,000원")
        ]
    }
}
