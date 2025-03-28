//
//  BookDetailsView.swift
//  HarryPotterSeriesApp
//
//  Created by 양원식 on 3/28/25.
//

import UIKit
import SnapKit

class BookDetailsView: UIView {
    
    // MARK: - 뷰
    private let bookImageView = BookImageView()
    private let bookInfoView = BookInfoView()
    
    
    // MARK: - 스택
    private lazy var detailsStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [bookImageView, bookInfoView])
        view.axis = .horizontal
        view.spacing = 10
        return view
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
        addSubview(detailsStack)
        detailsStack.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalTo(safeAreaLayoutGuide).offset(5)
        }
    }
    
    func configure(with title: String, author: String, releaseDate: String, pages: Int) {
        bookImageView.configure(with: "1") // [ 추후 변경 예정 ]
        bookInfoView.configure(with: title, author: author, releaseDate: releaseDate, pages: pages)
    }
}
