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
    
    private lazy var scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = true
        $0.showsHorizontalScrollIndicator = false
    }
    
    private lazy var contentView = UIView()
    

//    // 검색창
//    public lazy var searchField = UITextField().then {
//        $0.backgroundColor = UIColor.systemGray6
//        $0.attributedPlaceholder = NSAttributedString(string: "브랜드, 상품, 프로필 태그 등", attributes: [
//            NSAttributedString.Key.foregroundColor: UIColor.lightGray,
//            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13.5)
//        ])
//        $0.textColor = UIColor.black
//        $0.layer.cornerRadius = 15
//        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
//        $0.leftViewMode = .always
//        $0.translatesAutoresizingMaskIntoConstraints = false
//    }
    
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
    
    private lazy var justdroppedLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 16, weight:.bold)
        $0.textColor = .black
        $0.textAlignment = .left
        $0.text = "Just Dropped"
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private lazy var justdroppedSubLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 13)
        $0.textColor = .lightGray
        $0.textAlignment = .left
        $0.text = "발매 상품"
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // conductCollectionView
    let conductCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.itemSize = CGSize(width: 142, height: 237)
        $0.minimumInteritemSpacing = 8
        $0.scrollDirection = .horizontal
    }).then {
        $0.isScrollEnabled = true
        $0.register(JustDroppedViewCell.self, forCellWithReuseIdentifier: JustDroppedViewCell.identifier)
    }
    
    public lazy var challengeTitleLabel = UILabel().then {
            $0.text = "본격 한파대비! 연말 필수템 모음"
            $0.textColor = .black
            $0.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            $0.textAlignment = .left
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        public lazy var challengeSubtitleLabel = UILabel().then {
            $0.text = "#해피홀리룩챌린지"
            $0.textColor = .systemGray2
            $0.font = UIFont.systemFont(ofSize: 13)
            $0.textAlignment = .left
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let challengeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.itemSize = CGSize(width: 124, height: 165)
        $0.minimumInteritemSpacing = 8
        $0.scrollDirection = .horizontal
    }).then {
        $0.isScrollEnabled = true
        $0.register(instaViewCell.self, forCellWithReuseIdentifier: instaViewCell.identifier)
    }
    
    
    private func addComponents() {
            addSubview(scrollView)
            scrollView.addSubview(contentView)
            
            [
                searchButton, alarmButton, segmentedControl, underlineView, promoimageView,
                homeCollectionView, justdroppedLabel, justdroppedSubLabel, conductCollectionView,
                challengeTitleLabel, challengeSubtitleLabel, challengeCollectionView
            ].forEach { contentView.addSubview($0) }
            
            scrollView.snp.makeConstraints {
                $0.edges.equalToSuperview()
            }
            
            contentView.snp.makeConstraints {
                $0.edges.equalToSuperview()
                $0.width.equalTo(scrollView)
            }
            
            searchButton.snp.makeConstraints {
                $0.top.equalToSuperview()
                $0.left.equalToSuperview().offset(16)
                $0.right.equalToSuperview().offset(-55)
                $0.height.equalTo(40)
            }
            
            alarmButton.snp.makeConstraints {
                $0.top.equalToSuperview()
                $0.right.equalToSuperview().offset(-16)
                $0.height.width.equalTo(24)
            }
            
            segmentedControl.snp.makeConstraints {
                $0.top.equalTo(searchButton.snp.bottom).offset(16)
                $0.left.right.equalToSuperview().inset(16)
                $0.height.equalTo(27)
            }
            
            underlineView.snp.makeConstraints {
                $0.top.equalTo(segmentedControl.snp.bottom)
                $0.left.equalTo(segmentedControl.snp.left)
                $0.width.equalTo(segmentedControl.frame.width / CGFloat(segmentedControl.numberOfSegments))
                $0.height.equalTo(2)
            }
            
            promoimageView.snp.makeConstraints {
                $0.top.equalTo(underlineView.snp.bottom).offset(16)
                $0.left.right.equalToSuperview()
                $0.height.equalTo(336)
            }

            homeCollectionView.snp.makeConstraints {
                $0.top.equalTo(promoimageView.snp.bottom).offset(20)
                $0.left.equalToSuperview().offset(16)
                $0.right.equalToSuperview().offset(-17)
                $0.height.equalTo(232)
            }
            
            justdroppedLabel.snp.makeConstraints {
                $0.top.equalTo(promoimageView.snp.bottom).offset(252)
                $0.left.equalToSuperview().offset(16)
            }
            
            justdroppedSubLabel.snp.makeConstraints {
                $0.top.equalTo(justdroppedLabel.snp.bottom).offset(4)
                $0.left.equalTo(justdroppedLabel)
            }
            
            conductCollectionView.snp.makeConstraints {
                $0.top.equalTo(justdroppedSubLabel.snp.bottom).offset(14)
                $0.left.equalToSuperview().offset(16)
                $0.width.equalTo(442)
                $0.height.equalTo(237)
            }
            
            challengeTitleLabel.snp.makeConstraints {
                $0.top.equalTo(conductCollectionView.snp.bottom).offset(50)
                $0.left.equalTo(16)
            }
            
            challengeSubtitleLabel.snp.makeConstraints {
                $0.top.equalTo(challengeTitleLabel.snp.bottom).offset(4)
                $0.left.equalTo(challengeTitleLabel)
            }
            
            challengeCollectionView.snp.makeConstraints {
                $0.top.equalTo(challengeSubtitleLabel.snp.bottom).offset(14)
                $0.left.equalTo(challengeTitleLabel)
                $0.height.equalTo(165)
                $0.width.equalTo(388)
                $0.bottom.equalTo(contentView.snp.bottom).offset(-20) // 스크롤 가능한 범위 설정
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
            homeCollectionView.isHidden = false
        default:
            promoimageView.isHidden = true
            homeCollectionView.isHidden = true
        }
        
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
    }
    

}
