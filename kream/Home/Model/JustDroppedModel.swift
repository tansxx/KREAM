//
//  JustDroppedModel.swift
//  kream
//
//  Created by 강희정 on 11/3/24.
//

import Foundation
import Kingfisher

struct JustDroppedModel {
    let droppedImage: String?
    let urlImage: String?
    let transaction: String
    let brandName: String
    let productName: String
    let price: String
}

extension JustDroppedModel {
    static func dummy() -> [JustDroppedModel] {
        return [
            JustDroppedModel(droppedImage: "main_img", urlImage: nil, transaction: "거래 33.5만", brandName: "Matin Kim", productName: "마뗑킴 로고 코팅 점퍼 블랙", price: "345,000원"),
            JustDroppedModel(droppedImage: "justimage1", urlImage: nil, transaction: "거래 12.8만", brandName: "MLB", productName: "청키라이너 뉴욕양키스", price: "139,000원"),
            JustDroppedModel(droppedImage: "justimage2", urlImage: nil, transaction: "거래 15.6만", brandName: "Jordan", productName: "Jordan 1 Retro High OG\nYellow Ochre", price: "228,000원"),
            JustDroppedModel(droppedImage: "justimage4", urlImage: nil, transaction: "거래 13.9만", brandName: "Human Made", productName: "Human Made x Kaws\nVarsity Jacket #1 Black", price: "2,000,000원"),
            JustDroppedModel(droppedImage: nil, urlImage: "https://kream-phinf.pstatic.net/MjAyNDExMjlfMTE0/MDAxNzMyODY4MjcwMjI0.0E_ilwetcDBppiZJgGJOPl83-eQtNW5osfekYsQUdCQg.xW1z0KEhCkXqjMnBMJvVrhQnHvVfbyq35T-k64JV98og.PNG/a_b1b406fdcc6542408e306599769662c5.png?type=l_webp", transaction: "거래 11.2만", brandName: "Human Made", productName: "Human Made Heart Heavyweight Hoodie Black Salmon Pink - Seoul Store Exclusive", price: "999,000원"),
            JustDroppedModel(droppedImage: nil, urlImage: "https://kream-phinf.pstatic.net/MjAyNDExMTJfMjcg/MDAxNzMxMzg5NTcwMzk0.VmirvBsUc3KtZuK21XqBtIc-vgYXWyUN3Kg4FEp1Jpwg.tpf-Kcc50300txgYMXaUrlUSOowaxxd_4C9hO6WBogIg.PNG/a_1c30fd94cae14388b0087aca4c59c8e2.png?type=l_webp", transaction: "거래 9.2만", brandName: "Teddy Tales", productName: "HTeddy Tales Lina Bear Signature Keyring Milk Tea", price: "73,000원"),
            JustDroppedModel(droppedImage: nil, urlImage: "https://kream-phinf.pstatic.net/MjAyNDExMjdfODEg/MDAxNzMyNzAwMjk2Mzcy.a25Uk_U0tDopSIbyAPV0cEUyIDwnhjaFaI2W3MIogdYg.lxq86SsA7oOLX8FjO6jylt01K07uvWUP1-9AHvPRljEg.PNG/a_52532a710e324c2e8f1dffa7d12e2fe2.png?type=l_webp", transaction: "거래 20.8만", brandName: "Nike", productName: "Nike x Drake Nocta Sunset Puffer Jacket Mica Green Cyber (FN8196-330)", price: "780,000원"),
            JustDroppedModel(droppedImage: nil, urlImage: "https://kream-phinf.pstatic.net/MjAyNDA5MTFfMjcw/MDAxNzI2MDMzNTA2NTM0.Vsf4ChTKVO6Ouutb2QBzNKbCFnP0TbzLI5NsDjwWsv0g.u0OIt1g_9IqWhGtqGbBVOfDMUtoF89AxmxVVYBRnRS4g.PNG/a_0f89861ffd2e4c72a93ef7cb394767d0.png?type=l_webp", transaction: "거래 16.7만", brandName: "Sansan Gear", productName: "Sansan Gear Fleece Cross Bag Sky Blue", price: "119,000원"),
            JustDroppedModel(droppedImage: nil, urlImage: "https://kream-phinf.pstatic.net/MjAyNDExMjlfMjA1/MDAxNzMyODUzMzMxMzU2.tUBVaA4aNHayJJMoJSREZcjTvZdyVglBtLjYj46uah0g.iB6b49oEN2tTQ5xBd3SdLmJQ354OhzBZ6nSf5zJYK8gg.JPEG/p_7e4413e3e0d640b483654f66dcda7a1c.jpg?type=l_webp", transaction: "거래 5.7만", brandName: "OR-FIUME", productName: "OR-FIUME Fragrance Tag Fresh As Fuck Purple Aura Orchid", price: "15,000원"),
            JustDroppedModel(droppedImage: nil, urlImage: "https://kream-phinf.pstatic.net/MjAyNDExMjdfOTgg/MDAxNzMyNjczNzExNDIw.mS60eNYpObfSZ1SVnPZuB-ZpbRTUOGG00iQOP3NQKYAg.95UwWlgkhCZqJwbLzc-XPWfqWhp6-c-SmP1K0PhkZYMg.JPEG/p_3da6e55ad7e740e8aa84443e02edfddf.jpg?type=l_webp", transaction: "거래 18.6만", brandName: "GUVO", productName: "GUVO Poser Vintage Cap Vintage Red", price: "49,000원")
        ]
    }
}
