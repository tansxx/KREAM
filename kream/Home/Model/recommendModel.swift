//
//  recommendModel.swift
//  kream
//
//  Created by 강희정 on 10/11/24.
//


import UIKit

struct RecommendModel {
    let image: UIImage
    let name: String
}

extension RecommendModel {
    static func dummy() -> [RecommendModel] {
        return [
            RecommendModel(image: .maincell1, name: "크림 드로우"),
            RecommendModel(image: .maincell2, name: "실시간 차트"),
            RecommendModel(image: .maincell3, name: "남성 추천"),
            RecommendModel(image: .maincell4, name: "여성 추천"),
            RecommendModel(image: .maincell5, name: "색다른 추천"),
            RecommendModel(image: .maincell6, name: "정가 아래"),
            RecommendModel(image: .maincell7, name: "윤세 24AW"),
            RecommendModel(image: .maincell8, name: "올해의 베스트"),
            RecommendModel(image: .maincell9, name: "10월 베네핏"),
            RecommendModel(image: .maincell10, name: "아크네 선물")
        ]
    }
}
