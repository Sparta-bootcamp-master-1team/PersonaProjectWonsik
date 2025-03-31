//
//  Series.swift
//  HarryPotterSeriesApp
//
//  Created by 양원식 on 3/28/25.
//

import UIKit
import SnapKit

class SeriesButtonView: UIView {
    
    // 시리즈 버튼 [ 추후 시리즈 숫자에 맞게 버튼 생성 ]
    private let button: UIButton = {
        var button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
        return button
    }()
    
    // MARK: - 초기화
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UI 구성
    private func setupUI() {
        addSubview(button)
        button.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(30)
            $0.top.equalToSuperview().offset(16)
            $0.bottom.equalToSuperview()
        }
    }
    
    func configure(book: Book) {
        button.setTitle("1", for: .normal)
    }
}
