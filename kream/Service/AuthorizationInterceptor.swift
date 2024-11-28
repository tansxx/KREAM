//
//  AuthorizationInterceptor.swift
//  kream
//
//  Created by 강희정 on 11/17/24.
//

import Foundation
import Alamofire

final class AuthorizationInterceptor: RequestInterceptor {
    private let kakaoKey: String
    
    init(kakaoKey: String) {
        self.kakaoKey = kakaoKey
    }
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, any Error>) -> Void) {
        var request = urlRequest
        request.setValue("KakaoAK \(kakaoKey)", forHTTPHeaderField: "Authorization")
        completion(.success(request))
    }
    
    func retry(_ request: Request, for session: Session, dueTo error: any Error, completion: @escaping (RetryResult) -> Void) {
        completion(.doNotRetry)
    }
    
}
