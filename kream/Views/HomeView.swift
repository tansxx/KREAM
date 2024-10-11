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
    

    let recommendView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
            $0.estimatedItemSize = .init(width: 61, height: 81)
            $0.minimumInteritemSpacing = 10
        }).then {
            $0.backgroundColor = .clear
            $0.isScrollEnabled = false
            $0.register(recommendViewCell.self, forCellWithReuseIdentifier: recommendViewCell.identifier)
        }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        return view
    }()
    
    private func addComponents() {
        [
            alarmButton,
            segmentedControl,
            recommendView,
            underlineView
        ].forEach {
            addSubview($0)
        }
        
        alarmButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(59)
            $0.right.equalToSuperview().offset(-16)
            $0.height.width.equalTo(24)
        }
        
        segmentedControl.snp.makeConstraints {
            $0.top.equalToSuperview().offset(107)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(27)
            $0.width.equalTo(325)
        }
        
        underlineView.snp.makeConstraints {
            $0.left.equalTo(segmentedControl.snp.left)
            $0.width.equalTo(segmentedControl.frame.width / CGFloat(segmentedControl.numberOfSegments)) // 세그먼트 넓이로 설정
            $0.height.equalTo(2)
            $0.bottom.equalTo(segmentedControl.snp.bottom).offset(2)
        }
        
        recommendView.snp.makeConstraints {
            $0.top.equalTo(underlineView)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview().inset(327)
        }
    
    }
    
    @objc private func changeUnderLinePosition() {
        let segmentIndex = CGFloat(segmentedControl.selectedSegmentIndex)
        let segmentWidth = segmentedControl.frame.width / CGFloat(segmentedControl.numberOfSegments)
        let leadingDistance = segmentWidth * segmentIndex
        
        UIView.animate (withDuration: 0.3, animations: {[weak self] in
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

}
