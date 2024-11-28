//
//  SearchDetailViewController.swift
//  kream
//
//  Created by 강희정 on 11/25/24.
//

import UIKit
import Then
import Moya

class SearchDetailViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate {
    
    private let provider = MoyaProvider<SearchTargetType>()
    private var searchResults: [Products] = [] // 검색 결과를 저장할 배열

    override func viewDidLoad() {
        super.viewDidLoad()
        view = searchDetailView
        view.backgroundColor = .white

        // searchTableView 설정
        searchDetailView.searchTableView.delegate = self
        searchDetailView.searchTableView.dataSource = self

        // UITextField delegate 설정
        searchDetailView.searchField.delegate = self
    }
    
    private let searchDetailView = SearchDetailView().then {
        $0.cancelButton.addTarget(self,action: #selector(cancelButtonTapped), for: .touchUpInside)
        $0.backButton.addTarget(self,action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    @objc
    private func backButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc
    private func cancelButtonTapped() {
        // 현재 표시된 모든 모달을 닫고 홈 화면으로 전환
        var presentingVC = self.presentingViewController

        // 최상위 뷰 컨트롤러를 찾음
        while let parent = presentingVC?.presentingViewController {
            presentingVC = parent
        }

        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            // 새로운 홈 화면 설정
            let homeViewController = HomeViewController()
            let navigationController = UINavigationController(rootViewController: homeViewController)
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
        }
    }

    // MARK: Return 버튼 클릭 시 통신 처리
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let query = textField.text, !query.isEmpty else {
            print("검색어를 입력하세요.")
            return false
        }
        
        // API 통신
        getSearchResults(query: query) { [weak self] result in
            switch result {
            case .success(let searchResponse):
                self?.searchResults = searchResponse
                DispatchQueue.main.async {
                    self?.searchDetailView.searchTableView.reloadData()
                }
            case .failure(let error):
                print("통신 에러: \(error.localizedDescription)")
            }
        }
        
        textField.resignFirstResponder()
        return true
    }

    // MARK: API 통신
    func getSearchResults(query: String, completion: @escaping (Result<[Products], Error>) -> Void) {
        provider.request(.getSearchResults(query: query)) { result in
            switch result {
            case .success(let response):
                do {
                    // 디버깅용 데이터 출력
                    print(String(data: response.data, encoding: .utf8) ?? "Invalid data")
                    
                    let searchResponse = try JSONDecoder().decode(SearchResponseModel.self, from: response.data)
                    completion(.success(searchResponse.products))
                } catch let decodingError {
                    print("디코딩 에러: \(decodingError)")
                    completion(.failure(decodingError))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

extension SearchDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let product = searchResults[indexPath.row] // Products 배열에서 요소 가져오기
        cell.textLabel?.text = product.title // title 속성 사용
        return cell
    }
}
