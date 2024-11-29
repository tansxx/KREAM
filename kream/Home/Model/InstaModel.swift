//
//  instaModel.swift
//  kream
//
//  Created by 강희정 on 11/3/24.
//

import Foundation
import Kingfisher

struct InstaModel {
    let instaImage: String?
    let urlImage: String?
    let instaId: String
}

extension InstaModel {
    static func dummy() -> [InstaModel] {
        
    return [
        InstaModel(instaImage: "instaimage1", urlImage: nil, instaId: "@Katarinabluu"),
        InstaModel(instaImage: "instaimage2", urlImage: nil, instaId: "@imwinter"),
        InstaModel(instaImage: "instaimage3", urlImage: nil, instaId: "@thousand_wooo"),
        InstaModel(instaImage: nil, urlImage: "https://mblogthumb-phinf.pstatic.net/MjAyNDAxMjRfMjA4/MDAxNzA2MDY5NDUwNzY2.WRHaKnCBflWszZHDscPdLYuNg3brV49sNeNDdHG_UiEg.mZ2NwlLTRCh-R4DPI_6iwAN3MJxFtigbzNzEbKvsw_kg.JPEG.gwmfruckwrl/231020-Natty-Instagram-3.jpeg?type=w800", instaId: "@natty_0530"),
        InstaModel(instaImage: nil, urlImage: "https://pbs.twimg.com/media/GKayPdYaIAA3Dl6.jpg", instaId: "@sunwoo"),
        InstaModel(instaImage: nil, urlImage: "https://pbs.twimg.com/media/Gc53zdJbsAAraTo.jpg", instaId: "@for_everyoung10"),
        InstaModel(instaImage: nil, urlImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQOxvTOHIWI0PRRy2keDAk-qMEfYfuAqRvZFzzSKjRfh2nl9fXcDdIfVfrd0eY2jLHbPk&usqp=CAU", instaId: "@imnotningning"),
        InstaModel(instaImage: nil, urlImage: "https://thumbnews.nateimg.co.kr/view610///news.nateimg.co.kr/orgImg/hm/2024/07/10/202407102158004510706_20240710220632_01.jpg", instaId: "@newjeans_official"),
        InstaModel(instaImage: nil, urlImage: "https://i.pinimg.com/736x/95/f3/14/95f3144c7ca60fbcb476082e28f25cc6.jpg", instaId: "@baeganghee"),
        InstaModel(instaImage: nil, urlImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjDgW8_Lbcmzlioe_Nrb-_l8o75zGCvn5sfSfOgzXDUNarfL_a", instaId: "@reinyourheart")
        ]
    }
}
