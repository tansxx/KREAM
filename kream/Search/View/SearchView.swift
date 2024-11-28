//
//  SearchView.swift
//  kream
//
//  Created by 강희정 on 10/14/24.
//

import UIKit
import Then
import SnapKit

class SearchView: UIView {

    public lazy var searchButton = UIButton().then {
        var configuration = UIButton.Configuration.filled()
    
        configuration.baseBackgroundColor = UIColor.systemGray6
        
        var titleAttribute = AttributedString("브랜드, 상품, 프로필 태그 등")
        titleAttribute.font = UIFont.systemFont(ofSize: 13.5)
        titleAttribute.foregroundColor = UIColor.systemGray
        configuration.attributedTitle = titleAttribute
        
        $0.contentHorizontalAlignment = .left
        $0.configuration = configuration
        $0.layer.cornerRadius = 12
        $0.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    
    public lazy var cancelButton = UIButton().then {
            $0.setTitle("취소", for: .normal)
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
            $0.setTitleColor(.black, for: .normal)
            $0.backgroundColor = .clear
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
    private lazy var divideLine = UIView().then {
        $0.backgroundColor = .systemGray5
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
        
        private lazy var recommendLabel = UILabel().then {
            $0.text = "추천 검색어"
            $0.font = UIFont.systemFont(ofSize: 15, weight: .bold)
            $0.textColor = .black
            $0.textAlignment = .left
        }
        
        public lazy var tagCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
            $0.minimumLineSpacing = 12
            $0.minimumInteritemSpacing = 8
            $0.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }).then {
            $0.isScrollEnabled = false
            $0.register(TagCell.self, forCellWithReuseIdentifier: TagCell.identifier)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        //MARK: - 화면설정
        override init(frame: CGRect) {
            super.init(frame: frame)

            setView()
            setConstraints()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func setView() {
            self.addSubview(searchButton)
            self.addSubview(cancelButton)
            self.addSubview(divideLine)
            self.addSubview(recommendLabel)
            self.addSubview(tagCollectionView)
        }

        private func setConstraints() {
            searchButton.snp.makeConstraints {
                $0.top.equalTo(safeAreaLayoutGuide).offset(7)
                $0.left.equalToSuperview().inset(16)
                $0.right.equalTo(cancelButton.snp.left).offset(-11)
                $0.height.equalTo(39)
            }
            
            cancelButton.snp.makeConstraints {
                $0.centerY.equalTo(searchButton)
                $0.right.equalToSuperview().inset(16)
                $0.width.equalTo(25)
                $0.height.equalTo(17)
            }
            
            divideLine.snp.makeConstraints {
                $0.top.equalTo(searchButton.snp.bottom).offset(11)
                $0.horizontalEdges.equalToSuperview()
                $0.height.equalTo(1)
            }
            
            recommendLabel.snp.makeConstraints {
                $0.top.equalTo(divideLine.snp.bottom).offset(30)
                $0.left.equalToSuperview().inset(16)
            }
            
            tagCollectionView.snp.makeConstraints {
                $0.top.equalTo(recommendLabel.snp.bottom).offset(11)
                $0.left.equalToSuperview().inset(15)
                $0.width.equalTo(332)
                $0.height.equalTo(80)
            }
        }

    }
