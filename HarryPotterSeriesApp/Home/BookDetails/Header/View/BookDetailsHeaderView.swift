//
//  BookDetailsHeaderView.swift
//  HarryPotterSeriesApp
//
//  Created by 양원식 on 3/31/25.
//

import UIKit
import SnapKit

class BookDetailsHeaderView: UIView {
    
    /// 책 이미지 뷰
    private let bookImageView = BookImageView()
    
    /// 책 정보 뷰
    private let bookInfoView = BookInfoView()
    
    private lazy var bookDetailsHeaderStack: UIStackView = {
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
        addSubview(bookDetailsHeaderStack)
        
        bookDetailsHeaderStack.snp.makeConstraints {
            $0.edges.equalToSuperview()

        }
        
    }
    
    func configure(book: Book) {
        bookImageView.configure(book: book)
        bookInfoView.configure(book: book)
    }
}
