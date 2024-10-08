//
//  SavedViewController.swift
//  kream
//
//  Created by 강희정 on 9/30/24.
//

import UIKit
import SnapKit
import Then

class SavedViewController: UIViewController {
    
    private let data = dummySavedModel.savedDatas

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = savedView
        configureHeaderView()
    }
    
    private lazy var savedView = SavedView().then {
        $0.tableView.dataSource = self
        $0.tableView.delegate = self
        $0.smallLabel.text = "전체 \(data.count)개"
    }
    
    private func configureHeaderView() {
        let headerView = UIView(frame:CGRect(x: 0, y : 0, width: view.frame.width, height: 50))
        let headerLabel = UILabel(frame: headerView.bounds)
        
        headerLabel.textAlignment = .left
        headerLabel.numberOfLines = 0
        headerLabel.text = "전체 \(data.count)개"
        
        headerView.addSubview(headerLabel)
        savedView.tableView.tableHeaderView = headerView
    
    }
    
}

extension SavedViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SavedCell", for: indexPath) as? SavedCell else {
            return UITableViewCell()
        }
        
        cell.configure(model: data[indexPath.row])
        
        return cell
    }
}
