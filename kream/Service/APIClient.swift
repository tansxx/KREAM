//
//  APIClient.swift
//  kream
//
//  Created by 강희정 on 11/17/24.
//

import Foundation
import Alamofire

final class APIClient {
    static let shared = APIClient()
    
    private let session: Session
    
    private init() {
        // Info.plist에서 API_KEY 가져오기
        guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String else {
            fatalError("API_KEY가 Info.plist에 설정되지 않았습니다.") // 오류 발생 시 앱 종료
        }
        
        let interceptor = AuthorizationInterceptor(kakaoKey: apiKey) // 가져온 API 키 전달
        session = Session(interceptor: interceptor)
    }
    
    public func request<T: Codable>(
        _ url: String,
        method: HTTPMethod,
        parameters: Parameters? = nil,
        completion: @escaping (Result<T, Error>) -> Void) {
            session.request(url, method: method, parameters: parameters)
                .validate()
                .responseDecodable(of: T.self) { response in
                    switch response.result {
                    case .success(let value):
                        completion(.success(value))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
            
        }
}
