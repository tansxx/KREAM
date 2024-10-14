//
//  HomeView.swift
//  kream
//
//  Created by 강희정 on 10/10/24.
//

import UIKit
import SnapKit
import Then

class HomeView: UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
        
        
        self.segmentedControl.addTarget(self, action: #selector(changeSegmentView(_:)), for: .valueChanged)
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 검색창
    public lazy var searchField = UITextField().then {
        $0.backgroundColor = UIColor.systemGray6
        $0.attributedPlaceholder = NSAttributedString(string: "브랜드, 상품, 프로필 태그 등", attributes: [
            NSAttributedString.Key.foregroundColor: UIColor.lightGray,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13.5)
        ])
        $0.textColor = UIColor.black
        $0.layer.cornerRadius = 15
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        $0.leftViewMode = .always
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    
    // 종 아이콘
    private lazy var alarmButton = UIButton().then {
        let button = UIButton()
        var configuration = UIButton.Configuration.plain()
  
        $0.setImage(UIImage(named: "ic_alarm"), for: .normal)
        $0.tintColor = .black
        $0.contentMode = .scaleAspectFill
        
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        configuration.imagePadding = 0
        
        
        $0.configuration = configuration
        $0.translatesAutoresizingMaskIntoConstraints = false
 
    }
    
    // 카테고리 (segmentcontrol)
    public lazy var segmentedControl = UISegmentedControl(items: ["추천", "랭킹", "발매정보", "럭셔리", "남성", "여성"]).then() {
        $0.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        $0.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        $0.setBackgroundImage(UIImage(), for: .highlighted, barMetrics: .default)
        $0.setDividerImage(UIImage(), forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        $0.backgroundColor = .clear
        $0.apportionsSegmentWidthsByContent = true
        $0.selectedSegmentIndex = 0
        $0.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 16, weight: .light)
            ],
            for: .normal
        )
        
        $0.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font:UIFont.systemFont(ofSize: 16, weight: .bold)
            ],
            for: .selected
        )
        
        $0.addTarget(self, action: #selector(changeUnderLinePosition), for: .valueChanged)
    }
    
    // 밑줄
    private lazy var underlineView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.style = .none
        return view
    }()
    
    // 광고 이미지
    public lazy var promoimageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = UIImage(named: "main_ad")
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // collectionview
    let homeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.itemSize = CGSize(width: 61, height: 81)
        $0.minimumLineSpacing = 20
        $0.minimumInteritemSpacing = 9
    }).then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = true
        $0.register(RecommendViewCell.self, forCellWithReuseIdentifier: RecommendViewCell.identifier)
    }
    
    
    private func addComponents() {
        [
            searchField,
            alarmButton,
            segmentedControl,
            underlineView,
            promoimageView,
            homeCollectionView
        ].forEach {
            addSubview($0)
        }
        
        searchField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(51)
            $0.left.equalToSuperview().offset(16)
            $0.right.equalToSuperview().offset(-55)
            $0.height.equalTo(40)
        }
        
        alarmButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(59)
            $0.right.equalToSuperview().offset(-16)
            $0.height.width.equalTo(24)
        }
        
        segmentedControl.snp.makeConstraints {
            $0.top.equalToSuperview().offset(107)
            $0.centerX.equalToSuperview()
            $0.left.right.equalToSuperview().inset(16)
            $0.height.equalTo(27)
        }
        
        underlineView.snp.remakeConstraints {
            $0.left.equalTo(segmentedControl.snp.left)
            $0.width.equalTo(segmentedControl.frame.width / CGFloat(segmentedControl.numberOfSegments)) // 세그먼트 넓이로 설정
            $0.height.equalTo(2)
            $0.top.equalTo(segmentedControl.snp.bottom)
        }
        
        promoimageView.snp.makeConstraints {
            $0.top.equalTo(underlineView.snp.bottom)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(336)
        }

        homeCollectionView.snp.makeConstraints {
            $0.top.equalTo(promoimageView.snp.bottom).offset(20)
            $0.left.equalToSuperview().offset(16)
            $0.right.equalToSuperview().offset(-17)
            $0.height.equalTo(232)
            $0.bottom.equalToSuperview().offset(-108)
        }
    
    }
    
    @objc private func changeUnderLinePosition() {
        let segmentIndex = CGFloat(segmentedControl.selectedSegmentIndex)
        let segmentWidth = segmentedControl.frame.width / CGFloat(segmentedControl.numberOfSegments)
        let leadingDistance = segmentWidth * segmentIndex

        
        UIView.animate (withDuration: 0.2, animations: {[weak self] in
            guard let self = self else {
                return
            }
            
            self.underlineView.snp.updateConstraints {
                $0.left.equalTo(self.segmentedControl).inset(leadingDistance)
                $0.width.equalTo(segmentWidth - 2)
            }
            
            self.layoutIfNeeded()

        })
    }
    
    @objc private func changeSegmentView(_ segment: UISegmentedControl) {
        switch segment.selectedSegmentIndex {
        case 0:
            promoimageView.isHidden = false
//            recommendView.isHidden = false
            homeCollectionView.isHidden = false
        default:
            promoimageView.isHidden = true
//            recommendView.isHidden = true
            homeCollectionView.isHidden = true
        }
        
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
    }
    

}
