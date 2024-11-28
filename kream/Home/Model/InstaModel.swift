//
//  instaModel.swift
//  kream
//
//  Created by 강희정 on 11/3/24.
//

import Foundation

struct InstaModel {
    let instaImage: String
    let instaId: String
}

extension InstaModel {
    static func dummy() -> [InstaModel] {
        
    return [
        InstaModel(instaImage: "instaimage1", instaId: "@Katarinabluu"),
        InstaModel(instaImage: "instaimage2", instaId: "@imwinter"),
        InstaModel(instaImage: "instaimage3", instaId: "@thousand_wooo")
        ]
    }
}
