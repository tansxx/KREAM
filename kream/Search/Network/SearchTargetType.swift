//
//  SearchTargetType.swift
//  kream
//
//  Created by 강희정 on 11/29/24.
//

import Foundation
import Moya


enum SearchTargetType {
    case getSearchResults(query: String)
}

extension SearchTargetType: TargetType {
    var baseURL: URL {
        guard let baseURL = URL(string: "https://dummyjson.com") else {
            fatalError("Error: Invalid URL")
        }
        
        return baseURL
    }
    
    var path: String {
        switch self {
        case .getSearchResults:
            return "/products/search"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getSearchResults:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getSearchResults(let query):
            return .requestParameters(
                parameters: ["q": query], // "q"라는 키에 query 값을 전달
                encoding: URLEncoding.queryString // URL 쿼리 형식으로 인코딩
            )
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    
}
