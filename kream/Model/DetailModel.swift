//
//  DetailModel.swift
//  kream
//
//  Created by 강희정 on 11/5/24.
//

import Foundation

struct DetailModel {
    let detailImage: String
}

extension DetailModel {
    static func dummy() -> [DetailModel] {
        return [
            DetailModel(detailImage: "color_img1"),
            DetailModel(detailImage: "color_img2"),
            DetailModel(detailImage: "color_img3"),
            DetailModel(detailImage: "color_img4"),
            DetailModel(detailImage: "color_img5"),
            DetailModel(detailImage: "color_img6"),
            DetailModel(detailImage: "color_img5")
        ]
    }
}
