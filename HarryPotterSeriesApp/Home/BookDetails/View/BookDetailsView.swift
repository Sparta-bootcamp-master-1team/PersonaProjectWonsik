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
    /// 스크롤 뷰
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.addSubview(detailsStack)
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    
    private let bookDetailsHeaderView = BookDetailsHeaderView()
    
    private let bookDetailsBodyView = BookDetailsBodyView()
    
    // MARK: - 스택
    
    private lazy var detailsStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [bookDetailsHeaderView, bookDetailsBodyView])
        stack.axis = .vertical
        stack.spacing = 24
        return stack
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
        
        scrollView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        detailsStack.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(scrollView.snp.width)
        }
        
    }
    
    func configure(book: Book) {
        bookDetailsHeaderView.configure(book: book)
        bookDetailsBodyView.configure(book: book)
    }
}
