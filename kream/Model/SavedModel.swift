//
//  SavedModel.swift
//  kream
//
//  Created by 강희정 on 10/4/24.
//

import Foundation

struct SavedModel {
    let savedImage: String
    let savedName: String
    let savedInfo: String
    let savedPrice: String
}

// 더미 데이터 작성
final class dummySavedModel {
    static let savedDatas: [SavedModel] = [
        SavedModel(savedImage: "product 1",
                   savedName: "손오공이 잃어버린 머리띠 반쪽",
                   savedInfo: "손오공이 장난치다가 머리띠 반쪽 잘라서 어딘가 숨겨둔 역사속 물건!!",
                   savedPrice: "942,192,000원"),
        
        SavedModel(savedImage: "product 2",
                   savedName: "골드 반지",
                   savedInfo: "결혼 준비하는 당신?!\n약혼녀에게 이 반지를 선물하는 건 어때요?!",
                   savedPrice: "12,000원"),
        
        SavedModel(savedImage: "product 3",
                   savedName: "하얀 신발",
                   savedInfo: "짝퉁 나이키 신발!\n정말 푹신푹신해서 걷다가 졸려서 넘어지...",
                   savedPrice: "90,000원"),
        
        SavedModel(savedImage: "product 4",
                   savedName: "에베레스트 다이아 반지",
                   savedInfo: "에베레스트 올라가서 다이아 구하고 만든 반지,,! 과연 이것을 누가 사갈 것인가??",
                   savedPrice: "1,292,999,000원"),
        
        SavedModel(savedImage: "product 5",
                   savedName: "아디다스다 신발",
                   savedInfo: "아디다스처럼 보이지만 아디다스가 아닐지도 모르는 신발 이 신발의 주인은 너야~~",
                   savedPrice: "120,000원"),
        
        SavedModel(savedImage: "product 6",
                   savedName: "황제 잠옷",
                   savedInfo: "어느 나라의 황제가 입었다던 잠옷\n크리스마스 트리같이 보이는 디자인!",
                   savedPrice: "120,000,000원"),
        
        SavedModel(savedImage: "product 7",
                   savedName: "고장난 기타",
                   savedInfo: "블라블라블라블라\n블라블라블라블라블라",
                   savedPrice: "130,000원"),
        
        SavedModel(savedImage: "product 8",
                   savedName: "하얀 음료",
                   savedInfo: "이 음료를 만시면 건강해져요\n근데 어디가 건강해질까요? 한 번 마셔보겠...",
                   savedPrice: "120,000원"),
        
        SavedModel(savedImage: "product 9",
                   savedName: "백 필름 후디 집업",
                   savedInfo: "코든 80%, 폴리에스터 20%",
                   savedPrice: "139,000원"),
        
        SavedModel(savedImage: "product 10",
                   savedName: "메시 룸 후디",
                   savedInfo: "길단 12500 베이직 후드 (USA 핏) 기능성/기모",
                   savedPrice: "68,000원")
    ]
}
