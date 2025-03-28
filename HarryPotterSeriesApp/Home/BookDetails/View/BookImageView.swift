//
//  BookImageView.swift
//  HarryPotterSeriesApp
//
//  Created by 양원식 on 3/28/25.
//

import UIKit
import SnapKit

class BookImageView: UIView {
    
    // MARK: - UI 요소
    private let bookImage: UIImageView = {
        let book = UIImageView()
        book.contentMode = .scaleAspectFit
        return book
    }()
    
    // MARK: - 초기화
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - UI 구성
    private func setUI() {
        addSubview(bookImage)
        
        bookImage.snp.makeConstraints {
            $0.width.equalTo(100)
            $0.height.equalTo(bookImage.snp.width).multipliedBy(1.5)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    func configure(with title: String) {
        bookImage.image = UIImage(named: "harrypotter\(title)")
    }
}
