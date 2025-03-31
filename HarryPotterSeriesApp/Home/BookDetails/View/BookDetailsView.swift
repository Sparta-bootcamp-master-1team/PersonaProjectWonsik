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
    
    private let bookDetailsHeaderView = BookDetailsHeaderView()
    
    private let bookDetailsBodyView = BookDetailsBodyView()
    
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.showsVerticalScrollIndicator = false
        return scroll
    }()
    
    // MARK: - 스택
    
    
    private lazy var bookDetailsStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [bookDetailsHeaderView, bookDetailsBodyView])
        view.axis = .vertical
        view.spacing = 24
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
        addSubview(scrollView)
        
        scrollView.addSubview(bookDetailsStack)
        
        bookDetailsStack.addArrangedSubview(bookDetailsHeaderView)
        bookDetailsStack.addArrangedSubview(bookDetailsBodyView)
        
        scrollView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.trailing.bottom.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        bookDetailsStack.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }

    }
    
    func configure(book: Book) {
        bookDetailsHeaderView.configure(book: book)
        bookDetailsBodyView.configure(book: book)
    }
}
